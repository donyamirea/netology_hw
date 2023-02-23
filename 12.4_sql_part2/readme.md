# Домашнее задание к занятию "`12.4 SQL. Часть 2 - Балашов Денис`"
   
### Задание 1
Одним запросом получите информацию о магазине, в котором обслуживается более 300 покупателей, и выведите в результат следующую информацию:

- фамилия и имя сотрудника из этого магазина;
- город нахождения магазина;
- количество пользователей, закреплённых в этом магазине.

```sql
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
```

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

---
### Задание 3
Получите информацию, за какой месяц была получена наибольшая сумма платежей, и добавьте информацию по количеству аренд за этот месяц.

```sql
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
```