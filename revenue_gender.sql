SELECT
  "category__via__category_id"."name" AS "category",
  SUM("public"."payment"."amount") AS "total"
FROM
  "public"."payment"
  FULL JOIN "public"."rental" AS "Rental" ON "public"."payment"."rental_id" = "Rental"."rental_id"
  FULL JOIN "public"."inventory" AS "Inventory" ON "Rental"."inventory_id" = "Inventory"."inventory_id"
 
LEFT JOIN "public"."film" AS "Film" ON "Inventory"."film_id" = "Film"."film_id"
  LEFT JOIN "public"."film_category" AS "Film Category" ON "Film"."film_id" = "Film Category"."film_id"
  LEFT JOIN "public"."category" AS "category__via__category_id" ON "Film Category"."category_id" = "category__via__category_id"."category_id"
WHERE
  (
    "Rental"."rental_date" >= timestamp with time zone '2008-01-01 00:00:00.000Z'
  )
 
   AND (
    "Rental"."rental_date" < timestamp with time zone '2013-01-01 00:00:00.000Z'
  )
GROUP BY
  "category__via__category_id"."category_id"
ORDER BY
  SUM("public"."payment"."amount") DESC
LIMIT
  5