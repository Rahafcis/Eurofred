view: sales_detail {
  sql_table_name: PUBLIC.SALES_DETAIL ;;

  dimension: belnr {
    type: string
    sql: ${TABLE}."BELNR" ;;
  }

  dimension: bukrs {
    type: string
    sql: ${TABLE}."BUKRS" ;;
  }

  dimension_group: erdat {
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
    sql: ${TABLE}."ERDAT" ;;
  }

  dimension: fkber {
    type: string
    sql: ${TABLE}."FKBER" ;;
  }

  dimension: gjahr {
    type: number
    sql: ${TABLE}."GJAHR" ;;
  }

  dimension: kndnr {
    type: string
    sql: ${TABLE}."KNDNR" ;;
  }

  dimension: matnr {
    type: string
    sql: ${TABLE}."MATNR" ;;
  }

  dimension: perio {
    type: number
    sql: ${TABLE}."PERIO" ;;
  }

  dimension: vkbur {
    type: string
    sql: ${TABLE}."VKBUR" ;;
  }

  dimension: vkgrp {
    type: string
    sql: ${TABLE}."VKGRP" ;;
  }

  dimension: vkorg {
    type: string
    sql: ${TABLE}."VKORG" ;;
  }

  dimension: werks {
    type: string
    sql: ${TABLE}."WERKS" ;;
  }

  dimension: wogbtr {
    type: number
    sql: ${TABLE}."WOGBTR" ;;
  }

  dimension: ww118 {
    type: string
    sql: ${TABLE}."WW118" ;;
  }

  dimension: zzlinea_pr {
    type: string
    sql: ${TABLE}."ZZLINEA_PR" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
