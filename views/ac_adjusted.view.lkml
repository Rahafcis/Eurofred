view: ac_adjusted {
  sql_table_name: `cisconsulting-project.predictive_forecasting.ac_adjusted`
    ;;

  dimension: adjustment {
    type: number
    sql: ${TABLE}.Adjustment ;;
  }

  dimension: budget {
    type: number
    sql: ${TABLE}.Budget ;;
  }

#  dimension: month {
#    type: string
#    sql: date_trunc(date(timestamp(ac_adjusted.Date)), month) ;;
#  }

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
    sql: timestamp(${TABLE}.Date) ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: total_adjustment {
    type: sum
    sql: ${adjustment} ;;
    value_format_name: eur_0
  }
  measure: total_budget {
    type: sum
    sql: ${budget} ;;
    value_format_name: eur_0
  }
}
