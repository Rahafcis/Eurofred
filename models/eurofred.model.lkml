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

explore: predictor {}

explore: forecast_full {}

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
join: monthly_forecast {
  relationship: many_to_one
  type: left_outer
  sql_on: ${sales_detail.date_month} = ${monthly_forecast.date_month} and ${products.familia} = ${monthly_forecast.family} ;;
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


explore: forecast_automl_2013_2018 {
  fields: [ALL_FIELDS*,-sales_detail.sales_during_holidays,-sales_detail.sales_during_heatwave]
  join: sales_detail {
    relationship: one_to_many
    sql_on: ${forecast_automl_2013_2018.item_id} = ${sales_detail.matnr} and ${forecast_automl_2013_2018.date_week} = ${sales_detail.date_week} ;;
  }
}

explore: monthly_forecast {
  join: sales_detail_agg {
    relationship: one_to_many
    type: left_outer
    sql_on: ${sales_detail_agg.month} = ${monthly_forecast.date_month} and ${sales_detail_agg.family} = ${monthly_forecast.family} ;;
  }

}
