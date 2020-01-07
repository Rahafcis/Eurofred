view: sales_product {
    derived_table: {
      sql: WITH
              FEATURES_T (FECHA) AS (
                  SELECT DISTINCT FECHA
                  FROM   FEATURES
              ),

              SALES_T (ERDAT, MATNR, WOGBTR) AS (
                SELECT DISTINCT ERDAT, MATNR, WOGBTR
                FROM SALES_DETAIL
                where region='08' and fkber = 'VENTA'
              )
              SELECT F.FECHA, nvl(S.MATNR,'No disponible'), nvl(S.WOGBTR,0)  WOGBTR
              FROM FEATURES_T AS F
              left JOIN SALES_T AS S
              on F.FECHA = S.ERDAT
              ORDER BY F.FECHA asc
               ;;
    }

    measure: count {
      type: count
      drill_fields: [detail*]
    }

    dimension: fecha {
      type: date
      sql: ${TABLE}."FECHA" ;;
    }

    dimension: nvls_matnrno_disponible {
      type: string
      label: "Product"
      sql: ${TABLE}."nvls_matnrno_disponible" ;;
    }

    dimension: wogbtr {
      type: number
      sql: ${TABLE}."WOGBTR" ;;
      label: "Sales"
    }

    set: detail {
      fields: [fecha, nvls_matnrno_disponible, wogbtr]
    }

  # # You can specify the table name if it's different from the view name:
  # sql_table_name: my_schema_name.tester ;;
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

# view: sales_product {
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
