SELECT
  DATE_TRUNC('year', "Rental"."rental_date") AS "Rental__rental_date",
  round(AVG("public"."rental_vs_time_renting"."time_rental"),2) AS "dias"
FROM
  "public"."rental_vs_time_renting"
  FULL JOIN "public"."rental" AS "Rental" ON "public"."rental_vs_time_renting"."rental_id" = "Rental"."rental_id"
WHERE
  (
    "Rental"."rental_date" >= timestamp with time zone '2008-01-01 00:00:00.000Z'
  )
 
   AND (
    "Rental"."rental_date" < timestamp with time zone '2013-01-01 00:00:00.000Z'
  )
GROUP BY
  DATE_TRUNC('year', "Rental"."rental_date")
ORDER BY
  DATE_TRUNC('year', "Rental"."rental_date") ASC