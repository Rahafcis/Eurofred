view: country {
  sql_table_name: PUBLIC.COUNTRY ;;

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}."COUNTRY" ;;
  }

  dimension: country_description {
    type: string
    sql: ${TABLE}."COUNTRY_DESCRIPTION" ;;
  }

  dimension: province {
    type: string
    sql: ${TABLE}."PROVINCE" ;;
  }

  dimension: province_description {
    type: string
    sql: ${TABLE}."PROVINCE_DESCRIPTION" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
