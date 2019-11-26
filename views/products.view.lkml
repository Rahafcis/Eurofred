view: products {
  sql_table_name: PUBLIC.PRODUCTS ;;

  dimension: clas {
    type: string
    sql: ${TABLE}."CLAS" ;;
  }

  dimension_group: f_baja {
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
    sql: ${TABLE}."F_BAJA" ;;
  }

  dimension: familia {
    type: string
    sql: ${TABLE}."FAMILIA" ;;
  }

  dimension: familia_descr {
    type: string
    sql: ${TABLE}."FAMILIA_DESCR" ;;
  }

  dimension: mandt {
    type: string
    sql: ${TABLE}."MANDT" ;;
  }

  dimension: matnr {
    type: string
    sql: ${TABLE}."MATNR" ;;
    label: "Código de producto"
    primary_key: yes
  }

  dimension: stufe {
    type: string
    sql: ${TABLE}."STUFE" ;;
  }

  dimension: zzlinea_pr {
    type: string
    sql: ${TABLE}."ZZLINEA_PR" ;;
    label: "Línea y Marca de producto
"
  }

  dimension: zzlinea_pr_descr {
    type: string
    sql: ${TABLE}."ZZLINEA_PR_DESCR" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
