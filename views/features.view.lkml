view: features {
  sql_table_name: PUBLIC.FEATURES ;;

  dimension: dia_de_semana {
    type: number
    sql: ${TABLE}."DIA_DE_SEMANA" ;;
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

  dimension: ipc {
    type: number
    sql: ${TABLE}."IPC" ;;
  }

  dimension: ola_calor {
    type: yesno
    sql: ${TABLE}."OLA_CALOR" ;;
  }

  dimension: pobl_activa {
    type: number
    sql: ${TABLE}."POBL_ACTIVA" ;;
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
