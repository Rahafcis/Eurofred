view: weather {
  sql_table_name: PUBLIC.WEATHER ;;

  dimension: dir {
    type: string
    sql: ${TABLE}."DIR" ;;
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

  dimension: horaracha {
    type: string
    sql: ${TABLE}."HORARACHA" ;;
  }

  dimension_group: horas_sol {
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
    sql: ${TABLE}."HORAS_SOL" ;;
  }

  dimension: horatmax {
    type: string
    sql: ${TABLE}."HORATMAX" ;;
  }

  dimension: horatmin {
    type: string
    sql: ${TABLE}."HORATMIN" ;;
  }

  dimension: nombre {
    type: string
    sql: ${TABLE}."NOMBRE" ;;
  }

  dimension: ola_calor {
    type: yesno
    sql: ${TABLE}."OLA_CALOR" ;;
  }

  dimension: prec {
    type: string
    sql: ${TABLE}."PREC" ;;
  }

  dimension: provincia {
    type: string
    sql: ${TABLE}."PROVINCIA" ;;
    primary_key: yes
  }

  dimension: racha {
    type: number
    sql: ${TABLE}."RACHA" ;;
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

  dimension: velmedia {
    type: number
    sql: ${TABLE}."VELMEDIA" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
