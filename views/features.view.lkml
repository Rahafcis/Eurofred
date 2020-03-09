view: features {
  sql_table_name: PUBLIC.FEATURES ;;

  dimension: dia_de_semana {
    type: number
    sql: ${TABLE}."DIA_DE_SEMANA" ;;
    hidden: no
  }

  dimension: Day {
    type: string
    sql:
    case
    when ${dia_de_semana}=1 then 'Sunday'
    when ${dia_de_semana}=2 then 'Monday'
    when ${dia_de_semana}=3 then 'Tuesday'
    when ${dia_de_semana}=4 then 'Wednesday'
    when ${dia_de_semana}=5 then 'Thursday'
    when ${dia_de_semana}=6 then 'Friday'
    when ${dia_de_semana}=7 then 'Saturday'
    End
    ;;
  }

  dimension: dia_festivo {
    type: yesno
    sql: ${TABLE}."DIA_FESTIVO" ;;
  }

  dimension_group: fecha {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."FECHA" ;;
    label: "Feature"
  }

  dimension: date {
    type: date
    sql: ${fecha_date} ;;
    primary_key: yes
    hidden: yes
  }

  dimension: fin_de_semana {
    type: yesno
    sql: ${TABLE}."FIN_DE_SEMANA" ;;
    label: "Weekend"
  }

  measure: ipc {
    type: average
    sql: ${TABLE}."IPC" ;;
  }

  dimension: ola_calor {
    type: yesno
    sql: ${TABLE}."OLA_CALOR" ;;
    label: "Was there a heatwave?"
  }

  dimension: active_population {
    type: number
    sql: ${TABLE}."POBL_ACTIVA" ;;
  }

  dimension: tmed  {
    type: number
    sql: ${TABLE}."TMED" ;;
  }

  measure: pobl_activa {
    type: average
    sql: ${TABLE}."POBL_ACTIVA" ;;
    label: "Average active population"
  }

  dimension: provincia {
    type: string
    sql: ${TABLE}."PROVINCIA" ;;
    label: "Province"
  }

  measure: tmax {
    type: average
    sql: ${tmed} ;;
    label: "Maximum Temperature"
  }

  measure: tavg {
    type: average
    sql: ${tmed} ;;
    label: "Average Temperature °C"
    value_format_name: decimal_0
  }

  measure: tmin {
    type: average
    sql: ${tmed} ;;
    label: "Minimum Temperature"
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
