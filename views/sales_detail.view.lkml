view: sales_detail {
  sql_table_name: PUBLIC.SALES_DETAIL ;;

  dimension: belnr {
    type: string
    sql: ${TABLE}."BELNR" ;;
    label: "Documento"
  }

  dimension: bukrs {
    type: string
    sql: ${TABLE}."BUKRS" ;;
    label: "Empresa"
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
    label: "Concepto"
  }

  dimension: gjahr {
    type: number
    sql: ${TABLE}."GJAHR" ;;
    label: "Ejercicio"
  }

  dimension: kndnr {
    type: string
    sql: ${TABLE}."KNDNR" ;;
  }

  dimension: matnr {
    type: string
    sql: ${TABLE}."MATNR" ;;
    label: "Producto"
  }

  dimension: perio {
    type: number
    sql: ${TABLE}."PERIO" ;;
    label: "Periodo"
  }

  dimension: vkbur {
    type: string
    sql: ${TABLE}."VKBUR" ;;
    label: "Delegacion"
  }

  dimension: vkgrp {
    type: string
    sql: ${TABLE}."VKGRP" ;;
    label: "Ventas"
  }

  dimension: vkorg {
    type: string
    sql: ${TABLE}."VKORG" ;;
    label: "Organización"
  }

  dimension: werks {
    type: string
    sql: ${TABLE}."WERKS" ;;
    label: "Almacén"
  }

  dimension: wogbtr {
    type: number
    sql: ${TABLE}."WOGBTR" ;;
    label: "Importe"
  }

  dimension: ww118 {
    type: string
    sql: ${TABLE}."WW118" ;;
    label: "Vendedor"
  }

  dimension: zzlinea_pr {
    type: string
    sql: ${TABLE}."ZZLINEA_PR" ;;
    label: "Línea y Marca de producto"
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
