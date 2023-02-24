use sakila;

#task 1 - DONE
select * from information_schema.t;

select sum(index_length) / sum(data_length) * 100 as index_to_table_ratio
from information_schema.tables
where table_schema = 'sakila';


#task 2 - DONE 
explain analyze
select distinct concat(c.last_name, ' ', c.first_name),
	   sum(p.amount) over (partition by c.customer_id, f.title)
from payment p, rental r, customer c, inventory i, film f
where date(p.payment_date) = '2005-07-30' and p.payment_date = r.rental_date and r.customer_id = c.customer_id and i.inventory_id = r.inventory_id;

select concat(customer.last_name, ' ', customer.first_name),
	   sum(payment.amount)
from payment
	 join rental on payment.payment_date = rental.rental_date
	 join customer on rental.customer_id = customer.customer_id
	 join inventory on rental.inventory_id = inventory.inventory_id
	 join film on inventory.film_id = film.film_id
where date(payment.payment_date) = '2005-07-30' 
	  and payment.payment_date = rental.rental_date 
      and rental.customer_id = customer.customer_id 
      and inventory.inventory_id = rental.inventory_id
group by customer.customer_id, customer.last_name, customer.first_name;


