view: forecast_automl {
  sql_table_name: "PUBLIC"."FORECAST_AUTOML"
    ;;

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

  dimension: item_id_week {
    sql: concat(${date_week}, ${item_id}) ;;
    hidden: yes
    primary_key: yes
    type: string
  }

  dimension: item_id {
    type: string
    sql: UPPER(${TABLE}."ITEM_ID") ;;
  }

  dimension: p10 {
    type: number
    sql: ${TABLE}."P10" ;;
    value_format_name: eur_0
  }

  dimension: p50 {
    type: number
    sql: ${TABLE}."P50" ;;
    value_format_name: eur_0
  }

  dimension: p90 {
    type: number
    sql: ${TABLE}."P90" ;;
    value_format_name: eur_0
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: avg_p10 {
    type: average
    sql: ${p10} ;;
    value_format_name: eur_0
  }

  measure: avg_p50 {
    type: average
    sql: ${p50} ;;
    value_format_name: eur_0
  }

  measure: avg_p90 {
    type: average
    sql: ${p90} ;;
    value_format_name: eur_0
  }
}
