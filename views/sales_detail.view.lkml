view: sales_detail {
  sql_table_name: PUBLIC.SALES_DETAIL ;;

  dimension: belnr {
    type: string
    sql: ${TABLE}."BELNR" ;;
    label: "Código de Documento"
  }

  dimension: bukrs {
    type: string
    sql: ${TABLE}."BUKRS" ;;
    label: "Código de Empresa"
    drill_fields: [vkbur]

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
    label: "Fecha"
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
    label:"Codigo de cliente"

  }

  dimension: matnr {
    type: string
    sql: ${TABLE}."MATNR" ;;
    label: "Código de Producto"
  }

  dimension: perio {
    type: number
    sql: ${TABLE}."PERIO" ;;
    label: "Periodo"
  }

  dimension: vkbur {
    type: string
    sql: ${TABLE}."VKBUR" ;;
    label: "Código de Delegacion"
  }

  dimension: vkgrp {
    type: string
    sql: ${TABLE}."VKGRP" ;;
    label: "Código de Ventas"
  }

  dimension: vkorg {
    type: string
    sql: ${TABLE}."VKORG" ;;
    label: "Código de Organización"
  }

  dimension: werks {
    type: string
    sql: ${TABLE}."WERKS" ;;
    label: "Código de Almacén"
  }

  dimension: wogbtr {
    type: number
    sql: ${TABLE}."WOGBTR" ;;
    label: "Importe"
  }

  measure: Total_Venta {
    type: sum
    sql:${wogbtr} ;;
    value_format_name: eur_0
  }

  dimension: ww118 {
    type: string
    sql: ${TABLE}."WW118" ;;
    label: "Código de Vendedor"
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
  set: user_details {
    fields: [vkorg]}
}
