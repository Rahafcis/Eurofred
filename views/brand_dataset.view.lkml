explore: brand_dataset {hidden: yes}
view: brand_dataset {
  derived_table: {
    sql: -- Getting week, brand, revenue
      with revenues as (select DATE_TRUNC('week', s.ERDAT) as week,
             p.ZZLINEA_PR as brand,
             sum(s.WOGBTR) as revenue
             from SALES_DETAIL s
             left join PRODUCTS p on s.matnr = p.matnr
             where s.FKBER = 'VENTA'
             and s.REGION = '08'
             and DATE_TRUNC('week', s.ERDAT) between '2013-01-07' and '2018-12-31'
             and p.ZZLINEA_PR in ('ADFU','ACFU','ACGE','ADDA','ADGE','ADHH','AIGE','AIFU','AICT','ACFE','REAA','AIDA','ACHY','ADFE','FCXFXT','FCASAS','FCXFXN')
             group by 1,2)

      -- Getting the corresponding families as metadata
      , meta as (select distinct r.brand, p.familia as family from revenues r left join products p on r.brand = p.zzlinea_pr)

      -- Building the cross join between week and product
      , week_brand as (
        SELECT DISTINCT fec.week, pr.brand FROM
        (SELECT DISTINCT DATE_TRUNC('week', fecha) as week FROM features where DATE_TRUNC('week', fecha) between '2013-01-07' and '2018-12-31') fec
        CROSS JOIN
        (SELECT brand FROM meta) pr)

      -- Populating the final dataset
      select w.week, w.brand, nvl(r.revenue,0) as revenue from week_brand w left join revenues r on w.week = r.week and w.brand = r.brand
      order by 1,2
       ;;
  }

  dimension_group: week {
    type: time
    timeframes: [
      raw,
      week,
    ]
    sql: ${TABLE}."WEEK" ;;
  }

  dimension: brand {
    type: string
    sql: ${TABLE}."BRAND" ;;
  }

  dimension: revenue {
    type: number
    sql: ${TABLE}."REVENUE" ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: total_revenue {
    type: sum
    sql: ${revenue} ;;
  }

  set: detail {
    fields: [ brand, revenue]
  }
}
