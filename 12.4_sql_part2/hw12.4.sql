show tables;

use sakila;

#task 1- Done
select * from staff;
select * from store;
select * from address;
select * from city where city_id = 300 or city_id = 576;
select * from rental;

SELECT DISTINCT rental.staff_id AS Store, staff.last_name as 'Фамилия', staff.first_name as 'Имя',city.city AS City, COUNT(DISTINCT rental.customer_id) AS Customers
FROM rental
INNER JOIN inventory ON rental.inventory_id = inventory.inventory_id
INNER JOIN store ON inventory.store_id = store.store_id
INNER JOIN address ON store.address_id = address.address_id
INNER JOIN city ON address.city_id = city.city_id
INNER JOIN staff ON rental.staff_id = staff.staff_id
WHERE rental.staff_id BETWEEN 1 AND 2
  AND city.city IN ('Lethbridge', 'Woodridge') -- Здесь нужно указать имена городов, например, 'New York' или 'Los Angeles'
GROUP BY rental.staff_id, city.city, staff.first_name, staff.last_name
HAVING COUNT(DISTINCT rental.customer_id) > 300
ORDER BY Store;

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