# Домашнее задание к занятию "`12.4 SQL. Часть 2 - Балашов Денис`"
   
### Задание 1
Одним запросом получите информацию о магазине, в котором обслуживается более 300 покупателей, и выведите в результат следующую информацию:

- фамилия и имя сотрудника из этого магазина;
- город нахождения магазина;
- количество пользователей, закреплённых в этом магазине.

```sql
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
```
![image](https://user-images.githubusercontent.com/117297288/221138541-97a4256d-2d1d-484a-ae85-e9a3c91af046.png)


---

### Задание 2
Получите количество фильмов, продолжительность которых больше средней продолжительности всех фильмов.

```sql
select count(title)
from film
where length > (
	select avg(length)
    	from film
);
```
![image](https://user-images.githubusercontent.com/117297288/221138679-c035a9dd-2951-401e-a919-5eaa2bcb3658.png)


---
### Задание 3
Получите информацию, за какой месяц была получена наибольшая сумма платежей, и добавьте информацию по количеству аренд за этот месяц.

```sql
select date_format(payment_date, '%Y-%m'),
	   sum(amount),
       count(rental_id)
from payment
group by date_format(payment_date, '%Y-%m')
order by sum(amount) desc
limit 1;
```
![image](https://user-images.githubusercontent.com/117297288/221138593-4eea400e-8e4c-469d-9c46-74f788d627cc.png)
