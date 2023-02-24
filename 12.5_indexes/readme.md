# Домашнее задание к занятию "`12.5 Индексы - Балашов Денис`"
   
### Задание 1
Напишите запрос к учебной базе данных, который вернёт процентное отношение общего размера всех индексов к общему размеру всех таблиц.

```sql
select sum(index_length) / sum(data_length) * 100 as index_to_table_ratio
from information_schema.tables
where table_schema = 'sakila';
```

---

### Задание 2
Выполните explain analyze следующего запроса:

```sql
select distinct concat(c.last_name, ' ', c.first_name), sum(p.amount) over (partition by c.customer_id, f.title)
from payment p, rental r, customer c, inventory i, film f
where date(p.payment_date) = '2005-07-30' and p.payment_date = r.rental_date and r.customer_id = c.customer_id and i.inventory_id = r.inventory_id
```
- перечислите узкие места;
- оптимизируйте запрос: внесите корректировки по использованию операторов, при необходимости добавьте индексы.

## Ответ
- перечислите узкие места;
1. Temporary table with deduplication - может использовать дополнительные ресурсы
2. Большое количество поиска совпадений в разных таблицах, что занимает много времени. В выводе 'explain' выглядит как "Nested loop inner join"

- оптимизируйте запрос: внесите корректировки по использованию операторов, при необходимости добавьте индексы.

1. Вместо указания таблиц во 'from' перечислю их в 'join'. Считаю , что так будет правильнее, ведь основной запрос идет к 'payment', а другие данные подтягиваются как связанные.
2. Т.к. в блоке 'where' есть данные для отбора, считаю, что блок 'sum() over()' можно изменить на просто 'sum()' - это должно сократить время выборки (и сократило)

```sql
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
```