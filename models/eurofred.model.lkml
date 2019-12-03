connection: "ef_dwh"

# include all the views
include: "/views/**/*.view"

datagroup: eurofred_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: eurofred_default_datagroup

explore: sales_detail {
  join: products {
    relationship: one_to_one
    sql_on: ${products.matnr} = ${sales_detail.matnr};;
  }

join: country {
  relationship: one_to_one
  sql_on: ${country.province}=${sales_detail.region};;
}
  }
  explore: weather {
    join: sales_detail {
      relationship: one_to_one
      sql_on: ${sales_detail.erdat_year}=${weather.fecha_year} ;;
    }
    join: country {
      relationship: one_to_one
      sql_on: ${country.province_description}=${weather.provincia} ;;
    }
  }
