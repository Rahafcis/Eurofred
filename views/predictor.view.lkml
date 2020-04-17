view: predictor {
  derived_table: {
    sql: select 0.3799 as mape, 'Arima' as predictor
      union all
      select 0.4066 as mape, 'Prophet' as predictor
      union all
      select 0.4533 as mape, 'DeepAR-plus' as predictor
       ;;
  }

  dimension: mape {
    type: number
    sql: ${TABLE}."MAPE" ;;
  }

  dimension: predictor {
    type: string
    sql: ${TABLE}."PREDICTOR" ;;
  }
}
