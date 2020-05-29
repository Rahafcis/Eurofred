# include: "eurofred.model.lkml"
#explore: test {}
view: test {
  derived_table: {
    explore_source: sales_detail {
      column: Total_Venta {}
      column: zzlinea_pr {}
      derived_column: rank {
      sql:
      RANK () OVER ( order by Total_Venta desc ) ;;
    }
  }
}
  dimension: Total_Venta {
    label: "Net Sales per product line"
    type: number
  }
  dimension: zzlinea_pr {
    label: "Brand & Product Line"
  }

  dimension: rank {
    type: number
  }


  dimension: top_product_lines {
    type: string
    sql: case when ${rank}<=20 then ${zzlinea_pr}
    when ${rank}>20 then 'Other' end ;;
  }

}

#explore: top_20_product_lines {}
view: top_20_product_lines {
  derived_table: {
    sql: with a as (WITH test AS (SELECT as098f6bcd462.*,
       RANK () OVER ( order by Total_Venta desc )  AS rank
FROM (SELECT
  sales_detail."ZZLINEA_PR"  AS zzlinea_pr,
  COALESCE(SUM((sales_detail."WOGBTR")  ), 0) AS Total_Venta
FROM PUBLIC.SALES_DETAIL  AS sales_detail

GROUP BY 1) as098f6bcd462
)
SELECT
  case when {% condition choose_rank %} test.rank {% endcondition %} then test.zzlinea_pr
    else 'Other' end  AS "test.top_product_lines",
  test.Total_Venta AS "test.total_venta_1"
FROM test

GROUP BY 1,2
ORDER BY 1
)

select "test.top_product_lines" as top_product_line, sum("test.total_venta_1") as total_net_sales from a group by 1 order by 2 desc
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: top_product_line {
    type: string
    sql: ${TABLE}."TOP_PRODUCT_LINE" ;;
  }

  dimension: total_net_sales {
    type: number
    sql: ${TABLE}."TOTAL_NET_SALES" ;;
    value_format_name: eur_0
  }

  set: detail {
    fields: [top_product_line, total_net_sales]
  }

  filter: choose_rank {
    type: number
    default_value: "<=20"

  }
}
