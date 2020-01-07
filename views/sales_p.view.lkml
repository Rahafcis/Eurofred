view: sales_p {
  derived_table: {
    sql: WITH
      FEATURES_T (FECHA)
      AS  (SELECT DISTINCT FECHA
          FROM   FEATURES),

      SALES_T (MATNR)
      AS (SELECT DISTINCT MATNR
         FROM   SALES_DETAIL
         where region='08' and fkber = 'VENTA'
        )

      SELECT   F.FECHA,
              S.MATNR
      FROM     FEATURES_T AS F
              CROSS JOIN SALES_T AS S
      ORDER BY F.FECHA desc
 limit 20000
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: fecha {
    type: date
    sql: ${TABLE}."FECHA" ;;
  }

  dimension_group: date {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${fecha};;
    label: "Date"
  }

  dimension: matnr {
    type: string
    sql: ${TABLE}."MATNR" ;;
  }

  set: detail {
    fields: [fecha, matnr]
  }
}
