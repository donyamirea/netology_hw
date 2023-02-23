# Домашнее задание к занятию "`12.3 SQL. Часть 1 - Балашов Денис`"
   
### Задание 1
Получите уникальные названия районов из таблицы с адресами, которые начинаются на “K” и заканчиваются на “a” и не содержат пробелов.

```sql
select distinct district
from address
where district like 'K%a' AND district not like '% %';
```

---

### Задание 2
Получите из таблицы платежей за прокат фильмов информацию по платежам, которые выполнялись в промежуток с 15 июня 2005 года по 18 июня 2005 года включительно и стоимость которых превышает 10.00.

```sql
select * 
from payment
where payment_date >= '2005-06-15 00:00:00' AND payment_date < '2005-06-19 00:00:00' AND amount > 10;
```

---
### Задание 3
Получите последние пять аренд фильмов.

```sql
select *
from rental
order by rental_date
desc;
```



---
### Задание 4
Одним запросом получите активных покупателей, имена которых Kelly или Willie.

Сформируйте вывод в результат таким образом:

все буквы в фамилии и имени из верхнего регистра переведите в нижний регистр,
замените буквы 'll' в именах на 'pp'.

`Ответ`

# Общий вывод:

```sql
select * 
from customer 
where first_name='KELLY' or first_name='WILLIE' and active=1;
```

# Отредактированный вывод 
```sql
select first_name, last_name,
	   replace (lower(first_name), 'll', 'pp'),
       replace (lower(last_name), 'll', 'pp') 
from customer 
where first_name='KELLY' or first_name='WILLIE' and active=1;
```
