show tables;

select * from staff;
select * from store;
select * from address;
select * from city where city_id = 300 or city_id = 576;
select * from rental;

select distinct rental.staff_id as Store, # id магазина
				city.city as City,
				count(distinct rental.customer_id) as Customers # зарегистрированные покупатели магазина			
from rental, city
	where  staff_id between 1 and 2 
				   and (select count(distinct customer_id) 
					   ) > 300 # критерий поиска магазина
	order by Store
;


SELECT DISTINCT rental.staff_id AS Store, city.city AS City, COUNT(DISTINCT rental.customer_id) AS Customers
FROM rental
INNER JOIN inventory ON rental.inventory_id = inventory.inventory_id
INNER JOIN store ON inventory.store_id = store.store_id
INNER JOIN address ON store.address_id = address.address_id
INNER JOIN city ON address.city_id = city.city_id
WHERE rental.staff_id BETWEEN 1 AND 2
  AND city.city IN ('Lethbridge', 'Woodridge') -- Здесь нужно указать имена городов, например, 'New York' или 'Los Angeles'
GROUP BY rental.staff_id, city.city
HAVING COUNT(DISTINCT rental.customer_id) > 300
ORDER BY Store;

SELECT 
    DATE_FORMAT(payment.payment_date, '%Y-%m') AS month,
    COUNT(DISTINCT rental.rental_id) AS rental_count,
    SUM(payment.amount) AS total_payment_amount
FROM payment
JOIN rental ON payment.rental_id = rental.rental_id
GROUP BY month
HAVING total_payment_amount = (
    SELECT MAX(total_amount)
    FROM (
        SELECT 
            SUM(payment.amount) AS total_amount,
            DATE_FORMAT(payment.payment_date, '%Y-%m') AS month
        FROM payment
        GROUP BY month
    ) subquery
);



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


#task 2 - DONE
select count(title)
from film
where length > (
	select avg(length)
    from film
);
 
select avg(length) from film;