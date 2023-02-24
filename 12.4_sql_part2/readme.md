# Домашнее задание к занятию "`12.4 SQL. Часть 2 - Балашов Денис`"
   
### Задание 1
Одним запросом получите информацию о магазине, в котором обслуживается более 300 покупателей, и выведите в результат следующую информацию:

- фамилия и имя сотрудника из этого магазина;
- город нахождения магазина;
- количество пользователей, закреплённых в этом магазине.

```sql
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
```
![image](https://user-images.githubusercontent.com/117297288/221174935-bf88bca7-21b2-4989-b04f-2dc57dc7e457.png)



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
