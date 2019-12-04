view: percentage {
  # # You can specify the table name if it's different from the view name:
  # sql_tableview: sql_runner_query {
  derived_table: {
    sql: SELECT sum(WOGBTR) as Total_Net_Sales ,
      sum(CASE WHEN ((sales_detail."REGION") = '08') THEN (sales_detail."WOGBTR") ELSE 0 END) as Barcelona_Net_Sales,
          sum(WOGBTR) /SUM(CASE WHEN ((sales_detail."REGION") = '08') THEN (sales_detail."WOGBTR")
          ELSE 0 END) as "sales_detail.total_sales_barcelona"
      FROM "EF_DWH"."PUBLIC"."SALES_DETAIL"  AS sales_detail ;;

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




  #
  # # Define your dimensions and measures here, like this:
  # dimension: user_id {
  #   description: "Unique ID for each user that has ordered"
  #   type: number
  #   sql: ${TABLE}.user_id ;;
  # }
  #
  # dimension: lifetime_orders {
  #   description: "The total number of orders for each user"
  #   type: number
  #   sql: ${TABLE}.lifetime_orders ;;
  # }
  #
  # dimension_group: most_recent_purchase {
  #   description: "The date when each user last ordered"
  #   type: time
  #   timeframes: [date, week, month, year]
  #   sql: ${TABLE}.most_recent_purchase_at ;;
  # }
  #
  # measure: total_lifetime_orders {
  #   description: "Use this for counting lifetime orders across many users"
  #   type: sum
  #   sql: ${lifetime_orders} ;;
  # }
}

# view: percentage {
#   # Or, you could make this view a derived table, like this:
#   derived_table: {
#     sql: SELECT
#         user_id as user_id
#         , COUNT(*) as lifetime_orders
#         , MAX(orders.created_at) as most_recent_purchase_at
#       FROM orders
#       GROUP BY user_id
#       ;;
#   }
#
#   # Define your dimensions and measures here, like this:
#   dimension: user_id {
#     description: "Unique ID for each user that has ordered"
#     type: number
#     sql: ${TABLE}.user_id ;;
#   }
#
#   dimension: lifetime_orders {
#     description: "The total number of orders for each user"
#     type: number
#     sql: ${TABLE}.lifetime_orders ;;
#   }
#
#   dimension_group: most_recent_purchase {
#     description: "The date when each user last ordered"
#     type: time
#     timeframes: [date, week, month, year]
#     sql: ${TABLE}.most_recent_purchase_at ;;
#   }
#
#   measure: total_lifetime_orders {
#     description: "Use this for counting lifetime orders across many users"
#     type: sum
#     sql: ${lifetime_orders} ;;
#   }
# }
