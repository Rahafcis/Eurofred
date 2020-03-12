view: products {
  sql_table_name: PUBLIC.PRODUCTS ;;

  #dimension: clas {
   # type: string
    #sql: ${TABLE}."CLAS" ;;
  #}

  #dimension_group: f_baja {
   # type: time
    #timeframes: [
     # raw,
      #date,
      #week,
      #month,
      #quarter,
      #year
    #]
    #convert_tz: no
    #datatype: date
    #sql: ${TABLE}."F_BAJA" ;;
  #}

  dimension: familia {
    type: string
    sql: ${TABLE}."FAMILIA" ;;
  }

  dimension: familia_descr {
    type: string
    sql: ${TABLE}."FAMILIA_DESCR" ;;
  }

  #dimension: mandt {
   # type: string
    #sql: ${TABLE}."MANDT" ;;
  #}

  dimension: matnr {
    type: string
    sql: ${TABLE}."MATNR" ;;
    primary_key: yes
  }

  #dimension: matnr_1 {
  #  type: string
   # sql: ${TABLE}."MATNR_1" ;;
  #}

  #dimension: stufe {
   # type: string
    #sql: ${TABLE}."STUFE" ;;
  #}

  dimension: zzlinea_pr {
    type: string
    sql: ${TABLE}."ZZLINEA_PR" ;;
  }

  dimension: zzlinea_pr_descr {
    type: string
    sql: ${TABLE}."ZZLINEA_PR_MARCA" ;;
    label: "Brand & Product Description"
  }

  measure: count {
    type: count
    drill_fields: []
  }

  #Revise these measures
  measure: count_unique_product {
    type: count_distinct
    sql: ${matnr} ;;
  }

  measure: count_unique_brand {
    type: count_distinct
    sql: ${zzlinea_pr} ;;
  }
}
