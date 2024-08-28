# Un-hide and use this explore, or copy the joins into another explore, to get all the fully nested relationships from this view
explore: nestedbigquery {

    join: nestedbigquery__item_name {
      view_label: "Nestedbigquery: Item Name"
      sql: LEFT JOIN UNNEST(${nestedbigquery.item_name}) as nestedbigquery__item_name ;;
      relationship: one_to_many
    }
}
view: nestedbigquery {
  sql_table_name: `sqsh-developer-pocs.squareshiftpdt.nestedbigquery` ;;

  dimension: item_name {
    hidden: yes
    sql: ${TABLE}.Item_Name ;;
  }
  dimension: order_id {
    type: string
    sql: ${TABLE}.Order_Id ;;
  }
  measure: count {
    type: count
    drill_fields: [item_name]
  }
}

view: nestedbigquery__item_name {

  dimension: nestedbigquery__item_name {
    type: string
    sql: nestedbigquery__item_name ;;
  }
}
