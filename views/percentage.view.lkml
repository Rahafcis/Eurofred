view: sql_runner_query {
  derived_table: {
    datagroup_trigger: eurofred
    sql: SELECT sum(WOGBTR) as Total_Net_Sales ,
      sum(CASE WHEN ((sales_detail."REGION") = '08') THEN (sales_detail."WOGBTR") ELSE 0 END) as Barcelona_Net_Sales,
          sum(WOGBTR) /SUM(CASE WHEN ((sales_detail."REGION") = '08') THEN (sales_detail."WOGBTR")
          ELSE 0 END) as "sales_detail.total_sales_barcelona"
      FROM "EF_DWH"."PUBLIC"."SALES_DETAIL"  AS sales_detail GROUP BY
         sum(WOGBTR);;

  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: total_net_sales {
    type: number
    sql: ${TABLE}."TOTAL_NET_SALES" ;;
  }

  dimension: barcelona_net_sales {
    type: number
    sql: ${TABLE}."BARCELONA_NET_SALES" ;;
  }

  dimension: sales_detail_total_sales_barcelona {
    type: number
    sql: ${TABLE}."sales_detail.total_sales_barcelona" ;;
    value_format_name: percent_0
  }

  set: detail {
    fields: [total_net_sales, barcelona_net_sales, sales_detail_total_sales_barcelona]
  }
}
