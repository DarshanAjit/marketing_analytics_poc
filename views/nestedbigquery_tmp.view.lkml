view: nestedbigquery_tmp {
  sql_table_name: `sqsh-developer-pocs.squareshiftpdt.nestedbigquery_tmp` ;;

  dimension: cve_id {
    type: string
    sql: ${TABLE}.`Cve Id` ;;
  }
  dimension: date_published {
    type: string
    sql: ${TABLE}.`Date Published` ;;
  }
  dimension: date_updated {
    type: string
    sql: ${TABLE}.`Date Updated` ;;
  }
  dimension: description {
    type: string
    sql: ${TABLE}.Description ;;
  }
  dimension: remediations__url {
    type: string
    sql: ${TABLE}.remediations.url ;;
    group_label: "Remediations"
    group_item_label: "URL"
  }
  dimension: remediations__url_data {
    type: string
    sql: ${TABLE}.remediations.`url data` ;;
    group_label: "Remediations"
    group_item_label: "URL Data"
  }
  dimension: remediations__url_tags {
    type: string
    sql: ${TABLE}.remediations.`url tags` ;;
    group_label: "Remediations"
    group_item_label: "URL Tags"
  }
  measure: count {
    type: count
  }
}
