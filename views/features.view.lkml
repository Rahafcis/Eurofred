view: features {
  sql_table_name: PUBLIC.FEATURES ;;

  dimension: dia_de_semana {
    type: number
    sql: ${TABLE}."DIA_DE_SEMANA" ;;
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
    Else 'Others'
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
  }

  dimension: fin_de_semana {
    type: yesno
    sql: ${TABLE}."FIN_DE_SEMANA" ;;
  }

  measure: ipc {
    type: average
    sql: ${TABLE}."IPC" ;;
  }

  dimension: ola_calor {
    type: yesno
    sql: ${TABLE}."OLA_CALOR" ;;
  }

  measure: pobl_activa {
    type: average
    sql: ${TABLE}."POBL_ACTIVA" ;;
    label: "Población Activa"
  }

  dimension: provincia {
    type: string
    sql: ${TABLE}."PROVINCIA" ;;
  }

  measure: tmax {
    type: average
    sql: ${TABLE}."TMAX" ;;
  }

  measure: tmed {
    type: average
    sql: ${TABLE}."TMED" ;;
  }

  measure: tmin {
    type: average
    sql: ${TABLE}."TMIN" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
