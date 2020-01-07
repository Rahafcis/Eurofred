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
  type: inner
  relationship: one_to_one
sql_on: ${country.province}=${sales_detail.region} and ${country.country}=${sales_detail.country};;
}

join: features {
  type: inner
  relationship: one_to_one
  sql_on: ${features.fecha_date}=${sales_detail.erdat_date} ;;
}


  }
  explore: features {
    join: sales_detail {
      type: inner
      relationship: one_to_one
      sql_on: ${features.fecha_date}=${sales_detail.erdat_date} ;;
    }

    join: country {
      relationship: one_to_one
      type: inner
      sql_on: ${country.province}=${sales_detail.region} ;;
    }

}
