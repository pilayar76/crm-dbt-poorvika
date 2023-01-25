select _id, item_object from (SELECT _id, arr.position,arr.item_object
FROM enquires,
jsonb_array_elements(transactions) with ordinality arr(item_object, position)) as a where item_object->'additional' is  null
