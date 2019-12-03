view: sales_detail {
  sql_table_name: PUBLIC.SALES_DETAIL ;;

  dimension: bukrs {
    type: string
    sql: ${TABLE}."BUKRS" ;;
    label: "Código de empresa"
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}."COUNTRY" ;;
    description: "País de la dirección de envío de la mercancía"
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
    label: "Date"
  }

  dimension: fkber {
    type: string
    sql: ${TABLE}."FKBER" ;;
    label: "Código de concepto"
  }

  dimension: gjahr {
    type: number
    sql: ${TABLE}."GJAHR" ;;
    label: "Ejercicio"
  }

  dimension: kndnr {
    type: string
    sql: ${TABLE}."KNDNR" ;;
    label: "Código de cliente"
  }

  dimension: land1 {
    type: string
    sql: ${TABLE}."LAND1" ;;
    label: "pais de la razón social del cliente"
  }

  dimension: matnr {
    type: string
    sql: ${TABLE}."MATNR" ;;
    label: "Código de producto"
  }

  dimension: perio {
    type: number
    sql: ${TABLE}."PERIO" ;;
  }

  dimension: rbeln {
    type: string
    sql: ${TABLE}."RBELN" ;;
    label: "Código de documento"
  }

  dimension: regio {
    type: string
    sql: ${TABLE}."REGIO" ;;
    description: "provincia de la razón social del cliente"
  }

  dimension: region {
    type: string
    sql: ${TABLE}."REGION" ;;
    description: "Provincia de la dirección de envío de la mercancía"
  }

  dimension: vkbur {
    type: string
    sql: ${TABLE}."VKBUR" ;;
    label: "Código de delegacion"
  }

  dimension: vkgrp {
    type: string
    sql: ${TABLE}."VKGRP" ;;
    label: "Ventas"
  }

  dimension: vkorg {
    type: string
    sql: ${TABLE}."VKORG" ;;
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

measure:Total_Venta {
type:sum
sql:${wogbtr}  ;;
label: "Total Net Sales"
}

  dimension: ww118 {
    type: string
    sql: ${TABLE}."WW118" ;;
    label: "Código de vendedor"
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
