view: monthly_forecast {
  sql_table_name: "PUBLIC"."MONTHLY_FORECAST"
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

  dimension: solution_family_week {
    sql: concat(${solution},${family},${date_week}) ;;
    hidden: yes
    primary_key: yes
    type: string
  }

  dimension: family {
    type: string
    sql: UPPER(${TABLE}."FAMILY") ;;
  }

  dimension: p10 {
    type: number
    sql: ${TABLE}."P10" ;;
  }

  dimension: p50 {
    type: number
    sql: ${TABLE}."P50" ;;
  }

  dimension: p90 {
    type: number
    sql: ${TABLE}."P90" ;;
  }

  dimension: solution {
    type: string
    sql: upper(${TABLE}."SOLUTION") ;;
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
  measure: total_p10 {
    type: sum
    sql: ${p10} ;;
    value_format_name: eur_0
  }

  measure: total_p50 {
    type: sum
    sql: ${p50} ;;
    value_format_name: eur_0
  }

  measure: total_p90 {
    type: sum
    sql: ${p90} ;;
    value_format_name: eur_0
  }
}
