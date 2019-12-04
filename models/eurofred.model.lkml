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
sql_on: ${country.province}=${sales_detail.region} and ${country.country}=(${sales_detail.country});;
}
join: weather {
  type: inner
  relationship: one_to_one
  sql_on: sql_on: ${weather.fecha_date}=${sales_detail.erdat_date} ;;
}
  }
  explore: weather {
    join: sales_detail {
      type: inner
      relationship: one_to_one
      sql_on: ${weather.fecha_date}=${sales_detail.erdat_date} ;;
    }
    join: country {
      type: inner
      relationship: one_to_one
      sql_on: ${country.province}=${sales_detail.region} ;;
    }

    join: products {
      relationship: many_to_one
      sql_on:${products.matnr} = ${sales_detail.matnr}  ;;

    }
  }

