# Un-hide and use this explore, or copy the joins into another explore, to get all the fully nested relationships from this view
explore: nestedbigquery_2 {
  hidden: no
    join: nestedbigquery_2__item_name__item_name {
      view_label: "Nestedbigquery 2: Item Name Item Name"
      sql: LEFT JOIN UNNEST(${nestedbigquery_2.item_name__item_name}) as nestedbigquery_2__item_name__item_name ;;
      relationship: one_to_many
    }
}
view: nestedbigquery_2 {
  sql_table_name: `sqsh-developer-pocs.marketing_analytics.nestedbigquery_2` ;;

  dimension: item_name__item_name {
    hidden: yes
    sql: ${TABLE}.item_name.item_name ;;
    group_label: "Item Name"
    group_item_label: "Item Name"
  }
  dimension: order_id {
    type: string
    sql: ${TABLE}.order_id ;;
  }
  measure: count {
    type: count
    drill_fields: [item_name__item_name]
  }
}

view: nestedbigquery_2__item_name__item_name {

  dimension: nestedbigquery_2__item_name__item_name {
    type: string
    sql: nestedbigquery_2__item_name__item_name ;;
  }
}
