view: country {
  sql_table_name: PUBLIC.COUNTRY ;;

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}."COUNTRY" ;;
    label: "Country Code"
  }

  dimension: country_description {
    type: string
    sql: ${TABLE}."COUNTRY_DESCRIPTION" ;;
    label: "Country"
  }

  dimension: province {
    type: string
    sql: ${TABLE}."PROVINCE" ;;
    label: "province Num"
    primary_key: yes
  }

  dimension: province_description {
    type: string
    sql: ${TABLE}."PROVINCE_DESCRIPTION" ;;
    label: "province"
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
