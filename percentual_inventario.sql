SELECT
  DATE_TRUNC('year', "public"."rental"."rental_date") AS "rental_date",
  round((count(distinct(inventory_id))::numeric / (select count(*) from inventory)) * 100,2) as "count"
FROM
  "public"."rental"
WHERE
  (
    "public"."rental"."rental_date" >= timestamp with time zone '2008-01-01 00:00:00.000Z'
  )
 
   AND (
    "public"."rental"."rental_date" < timestamp with time zone '2013-01-01 00:00:00.000Z'
  )
GROUP BY
  DATE_TRUNC('year', "public"."rental"."rental_date")
ORDER BY
  DATE_TRUNC('year', "public"."rental"."rental_date") ASC