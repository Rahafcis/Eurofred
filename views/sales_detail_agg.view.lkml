view: sales_detail_agg {
    derived_table: {
      sql: SELECT
        TO_CHAR(DATE_TRUNC('month', sales_detail."ERDAT" ), 'YYYY-MM') AS "sales_detail.date_month",
        products."FAMILIA"  AS "products.familia",
        COALESCE(SUM(CASE WHEN ((sales_detail."FKBER") = 'VENTA') THEN (case when sales_detail."WOGBTR" is null then 1 else sales_detail."WOGBTR" end)  ELSE NULL END), 0) AS "sales_detail.gross_sales"
      FROM PUBLIC.SALES_DETAIL  AS sales_detail
      LEFT JOIN PUBLIC.PRODUCTS  AS products ON (sales_detail."MATNR")=(products."MATNR")

      WHERE ((((sales_detail."ERDAT" ) >= (TO_DATE(TO_TIMESTAMP('2013-01-01'))) AND (sales_detail."ERDAT" ) < (TO_DATE(TO_TIMESTAMP('2020-12-31')))))) AND (((sales_detail."FKBER") = 'VENTA')) AND (((sales_detail."REGION") = '08'))
      GROUP BY DATE_TRUNC('month', sales_detail."ERDAT" ),2
       ;;
    }


    dimension: month {
      type: string
      sql: ${TABLE}."sales_detail.date_month" ;;
    }

    dimension: family {
      type: string
      sql: ${TABLE}."products.familia" ;;
    }

    dimension: gross_sales {
      type: number
      sql: ${TABLE}."sales_detail.gross_sales" ;;
    }

    measure: count {
      type: count
      drill_fields: [detail*]
    }
  measure: total_gross_sales {
    type: sum
    sql: ${gross_sales} ;;
  }

    set: detail {
      fields: []
    }
  }
