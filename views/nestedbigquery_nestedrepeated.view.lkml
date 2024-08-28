# Un-hide and use this explore, or copy the joins into another explore, to get all the fully nested relationships from this view
explore: nestedbigquery_nestedrepeated {
  label: "Nested / Repeated Bigquery Sample Explore"
  hidden: no
    join: nestedbigquery_nestedrepeated__addresses {
      view_label: "Nestedbigquery Nestedrepeated: Addresses"
      sql: LEFT JOIN UNNEST(${nestedbigquery_nestedrepeated.addresses}) as nestedbigquery_nestedrepeated__addresses ;;
      relationship: one_to_many
    }
}
view: nestedbigquery_nestedrepeated {
  sql_table_name: `sqsh-developer-pocs.squareshiftpdt.nestedbigquery_nestedrepeated` ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }
  dimension: addresses {
    hidden: yes
    sql: ${TABLE}.addresses ;;
  }
  dimension_group: dob {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.dob ;;
  }
  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }
  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }
  measure: count {
    type: count
    drill_fields: [id, last_name, first_name]
  }
}

view: nestedbigquery_nestedrepeated__addresses {

  dimension: address {
    type: string
    sql: address ;;
  }
  dimension: city {
    type: string
    sql: city ;;
  }
  dimension: nestedbigquery_nestedrepeated__addresses {
    type: string
    hidden: yes
    sql: nestedbigquery_nestedrepeated__addresses ;;
  }
  dimension: number_of_years {
    type: string
    sql: numberOfYears ;;
  }
  dimension: state {
    type: string
    sql: state ;;
  }
  dimension: status {
    type: string
    sql: status ;;
  }
  dimension: zip {
    type: zipcode
    sql: zip ;;
  }
}
