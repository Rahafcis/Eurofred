view: forecast_automl_2013_2018 {
  sql_table_name: "PUBLIC"."FORECAST_AUTOML_2013_2018"
    ;;

  dimension: item_id_week {
    sql: concat(${date_week}, ${item_id}) ;;
    hidden: yes
    primary_key: yes
    type: string
  }

  dimension: brand {
    type: string
    sql: ${TABLE}."BRAND" ;;
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

  dimension: family {
    type: string
    sql: upper(${TABLE}."FAMILY") ;;
  }

  dimension: item_id {
    type: string
    sql: ${TABLE}."ITEM_ID" ;;
  }

  dimension: p10 {
    type: number
    sql: ${TABLE}."P10" ;;
  }

  dimension: p90 {
    type: number
    sql: ${TABLE}."P100" ;;
  }

  dimension: p50 {
    type: number
    sql: ${TABLE}."P50" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: sum_p10 {
    type: sum
    sql: ${p10} ;;
    value_format_name: eur_0
  }

  measure: sum_p50 {
    type: sum
    sql: ${p50} ;;
    value_format_name: eur_0
  }

  measure: sum_p90 {
    type: sum
    sql: ${p90} ;;
    value_format_name: eur_0
  }
}
