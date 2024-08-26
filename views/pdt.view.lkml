
view: pdt {
  derived_table: {
    datagroup_trigger: looker_poc_pdt
    sql: SELECT * FROM `sqsh-developer-pocs.marketing_analytics.campaigns` ;;

  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: campaign_id {
    type: number
    sql: ${TABLE}.campaign_id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: start_date {
    type: date
    datatype: date
    sql: ${TABLE}.start_date ;;
  }

  dimension: end_date {
    type: date
    datatype: date
    sql: ${TABLE}.end_date ;;
  }

  dimension: budget {
    type: number
    sql: ${TABLE}.budget ;;
  }

  set: detail {
    fields: [
      campaign_id,
      name,
      type,
      start_date,
      end_date,
      budget
    ]
  }
}
