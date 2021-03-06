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


  dimension_group: date {
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
  label: "Transaction"
  }

  dimension: fkber {
    type: string
    sql: ${TABLE}."FKBER" ;;
    label: "Account"
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
    sql: case when ${TABLE}."WOGBTR" is null then 1 else ${TABLE}."WOGBTR" end ;;
    label: "Amount"
  }

measure:Total_Venta {
type:sum
sql:${wogbtr}  ;;
label: "Net Sales"
value_format_name: eur_0
#value_format: "0.0,,\" M\" \" €\""
}

measure:Total_Sales_Barcelona  {
  type: sum
  sql:${wogbtr}  ;;
  label: "Barcelona Total Gross Sales"
  value_format_name: eur_0
  filters: {
    field: region
    value: "08"
  }
  filters: {
    field: fkber
    value: "VENTA"
  }
}

measure: percetage_From_Total {
  type: number
  sql:${sales_detail.Total_Sales_Barcelona}/${Total_Venta} ;;
  value_format_name: percent_0
}

  dimension: ww118 {
    type: string
    sql: ${TABLE}."WW118" ;;
    label: "Código de vendedor"

  }

  dimension: zzlinea_pr {
    type: string
    sql: ${TABLE}."ZZLINEA_PR" ;;
    label: "Brand & Product Line"
  }

  measure: count {
    type: count
    drill_fields: []
  }

  #Revise these measures
  #measure: count_unique_product {
   # type: count_distinct
    #sql: ${matnr} ;;
    #}

  measure: count_distinct_brand {
    type: count_distinct
    sql: ${zzlinea_pr} ;;
  }

  measure: count_products {
    type: count_distinct
    sql: ${matnr} ;;
  }

  measure: gross_sales {
    type: sum
    sql: ${wogbtr} ;;
    filters: {
      field: fkber
      value: "VENTA"
    }
    value_format_name: eur_0
  }

  measure: sales_during_heatwave {
    type: sum
    sql: ${wogbtr} ;;
    filters: {
      field: fkber
      value: "VENTA"
    }
    filters: {
      field: features.ola_calor
      value: "Yes"
    }
    value_format_name: eur_0
}
  measure: sales_during_holidays {
    type: sum
    sql: ${wogbtr} ;;
    filters: {
      field: fkber
      value: "VENTA"
    }
    filters: {
      field: features.dia_festivo
      value: "Yes"
    }
    value_format_name:  eur_0
    }
}
