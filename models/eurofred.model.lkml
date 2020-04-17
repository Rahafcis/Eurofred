connection: "ef_dwh"

# include all the views
include: "/views/**/*.view"

week_start_day: monday

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
  join: top_20_product_lines {
    relationship: many_to_one
    type: left_outer
    sql_on: ${sales_detail.zzlinea_pr}=${top_20_product_lines.top_product_line};;
  }

join: country {
  type: inner
  relationship: one_to_one
sql_on: ${country.province}=${sales_detail.region} and ${country.country}=${sales_detail.country};;
  }

join: features {
  type: inner
  relationship: one_to_one
  sql_on: ${features.date}=${sales_detail.date_date} ;;
  }

join: forecast_arima {
  relationship: many_to_one
  sql_on: ${sales_detail.date_week} = ${forecast_arima.date_week} and ${products.familia} = ${forecast_arima.item_id} ;;
  }

join: forecast_automl {
  relationship: many_to_one
  sql_on: ${sales_detail.date_week} = ${forecast_automl.date_week} and ${products.familia} = ${forecast_automl.item_id} ;;
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
