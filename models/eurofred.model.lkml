connection: "ef_dwh"

# include all the views
include: "/views/**/*.view"


datagroup: eurofred_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: eurofred_default_datagroup

explore: products {}

explore: sales_detail {
  join: products {
    #relationship: many_to_one
    #type: left_outer
    relationship: many_to_one
    type: left_outer
    sql_on: ${sales_detail.matnr}=${products.matnr};;

  }

join: country {
  type: inner
  relationship: one_to_one
sql_on: ${country.province}=${sales_detail.region} and ${country.country}=${sales_detail.country};;
}

join: features {
  type: inner
  relationship: one_to_one
  sql_on: ${features.fecha_date}=${sales_detail.date_date} ;;
}
  }
  explore: features {
    join: sales_detail {
      type: inner
      relationship: one_to_one
      sql_on: ${features.fecha_date}=${sales_detail.date_date} ;;
    }

    join: country {
      relationship: one_to_one
      type: inner
      sql_on: ${country.province}=${sales_detail.region} ;;
    }

    #REVISE (Delete from here if not valid)



}


explore: features_products {}
