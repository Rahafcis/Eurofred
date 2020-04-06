view: full_sales {
  # it looks like this view cannot have primary key.
  sql_table_name: PUBLIC.FULL_SALES ;;

  dimension_group: fecha {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      time,
      year
    ]
    convert_tz: no
    sql: ${TABLE}."FECHA" ;;
  }

  dimension: sales {
    type: number
    sql: ${TABLE}."SALES" ;;
  }

  dimension: zzlinea_pr {
    type: string
    sql: ${TABLE}."ZZLINEA_PR" ;;
    label: "Product Line"
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: sum_sales {
    type: sum
    sql: ${sales} ;;
  }
}
