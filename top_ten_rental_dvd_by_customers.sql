select c.first_name ||' - '|| c3.country  as name, count(r.rental_id) as total  from rental r
  full join customer c on c.customer_id = r.customer_id 
 full join address a on a.address_id = c.address_id 
 full join city c2 on c2.city_id = a.city_id
 full join country c3 on c3.country_id = c2.country_id 
 where r.rental_date between '2008-01-01' and '2012-12-31'
 group by c.first_name ||' - '|| c3.country    
 order by count(r.rental_id) desc
 limit 5