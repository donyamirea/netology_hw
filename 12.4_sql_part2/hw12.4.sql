show tables;

use sakila;

#task 1- Done
select * from staff;
select * from store;
select * from address;
select * from city where city_id = 300 or city_id = 576;
select * from rental;

select customer.store_id,
	   concat(staff.first_name, ' ', staff.last_name),
	   city.city,
	   count(customer.customer_id)       
from customer
	join staff on customer.store_id = staff.store_id
	join store on staff.store_id = store.store_id
	join address on store.address_id = address.address_id
    	join city on address.city_id = city.city_id
where customer.active=1 
group by customer.store_id, staff.first_name, staff.last_name, city.city
having count(customer.customer_id) > 300;

# task 3 - DONE
select * from payment;

select date_format(payment_date, '%Y-%m'),
	   sum(amount),
       count(rental_id)
from payment
group by date_format(payment_date, '%Y-%m')
order by sum(amount) desc
limit 1;


#task 2 - DONE
select count(title)
from film
where length > (
	select avg(length)
    from film
);
