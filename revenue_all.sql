SELECT
  SUM("public"."payment"."amount") AS "sum"
FROM
  "public"."payment"
 
LEFT JOIN "public"."rental" AS "Rental" ON "public"."payment"."rental_id" = "Rental"."rental_id"
WHERE
  (
    "Rental"."rental_date" >= timestamp with time zone '2008-01-01 00:00:00.000Z'
  )
 
   AND (
    "Rental"."rental_date" < timestamp with time zone '2013-01-01 00:00:00.000Z'
  )