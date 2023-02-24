# Домашнее задание к занятию "`10.2 Кластеризация - Балашов Денис`"
   
### Задание 1
Напишите запрос к учебной базе данных, который вернёт процентное отношение общего размера всех индексов к общему размеру всех таблиц.

`Ответ [ссылка на источник|скриншот (можно добавлять через гитхаб - автоматом генерится линк)](http://example.com)`
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

`Ответ [ссылка на источник|скриншот (можно добавлять через гитхаб - автоматом генерится линк)](http://example.com)`