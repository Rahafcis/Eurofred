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
    sql_on: ${products.matnr} =  ${sales_detail.matnr};;
  }
}
