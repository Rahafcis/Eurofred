view: forecast_full {
  sql_table_name: "PUBLIC"."FORECAST_FULL"
    ;;

  dimension: arima {
    hidden: yes
    type: number
    sql: ${TABLE}."ARIMA" ;;
  }

  dimension_group: date {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."DATE" ;;
  }

  dimension: deeparplus {
    hidden: yes
    type: number
    sql: ${TABLE}."deepar-plus" ;;
  }

  dimension: item_id {
    type: string
    sql: UPPER(${TABLE}."ITEM_ID") ;;
  }

  dimension: prophet {
    hidden: yes
    type: number
    sql: ${TABLE}."PROPHET" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: avg_arima {
    type: average
    sql: ${arima} ;;
    value_format_name: eur_0
  }

  measure: avg_prophet {
    type: average
    sql: ${prophet} ;;
    value_format_name: eur_0
  }

  measure: avg_deeparplus {
    type: average
    sql: ${deeparplus} ;;
    value_format_name: eur_0
  }
}
