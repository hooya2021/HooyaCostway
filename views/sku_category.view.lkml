view: sku_category {
 derived_table: {
  sql: select xl.*,xxxl.sku as product_simple_sku from (SELECT tt.*,xxx.sku,xxx.entity_id as parent_product_id,t2.`value`  FROM (SELECT char_table.entity_id,entity_table.parent_id, char_table.value as second_value
        FROM catalog_category_entity_varchar as char_table
        LEFT JOIN catalog_category_entity as entity_table ON entity_table.entity_id = char_table.entity_id
        LEFT JOIN catalog_category_entity_int AS t3 ON t3.entity_id = entity_table.entity_id AND t3.attribute_id=42
        WHERE entity_table.level = 3 AND char_table.attribute_id = 41 AND t3.`value`=1
        GROUP BY char_table.value,char_table.entity_id,entity_table.parent_id) as tt
LEFT JOIN catalog_category_entity as t1 ON t1.entity_id = tt.parent_id
LEFT JOIN catalog_category_entity_varchar as t2 ON t2.entity_id = t1.entity_id AND t2.attribute_id=41
LEFT JOIN catalog_category_entity_int AS t4 ON t4.entity_id = t1.entity_id AND t4.attribute_id=42
left join catalog_category_product as xx on xx.category_id = tt.entity_id
left join catalog_product_entity as xxx on xxx.entity_id = xx.product_id
WHERE t4.`value`=1) as xl
left join catalog_product_relation as xxl on xxl.parent_id = xl.parent_product_id
left join catalog_product_entity as xxxl on xxxl.entity_id = xxl.child_id
 ;;
}

measure: count {
  type: count
  drill_fields: [detail*]
}

dimension: entity_id {
  type: number
  sql: ${TABLE}.entity_id ;;
}

dimension: parent_id {
  type: number
  sql: ${TABLE}.parent_id ;;
}

dimension: second_value {
  type: string
  sql: ${TABLE}.second_value ;;
}

dimension: main_sku {
  type: string
  sql: ${TABLE}.sku;;
}

dimension: parent_sku {
  type: string
  sql: ${TABLE}.product_simple_sku ;;
}

dimension: sku {
  type: string
  sql: if(${parent_sku} is null,${main_sku},${parent_sku}) ;;
}
dimension: value {
  type: string
  sql: ${TABLE}.value ;;
}

set: detail {
  fields: [entity_id, parent_id, second_value, main_sku, parent_sku,value]
}
}
