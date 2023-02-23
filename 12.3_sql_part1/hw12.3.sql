create database sakila;

use sakila;

show tables;
#task 4 - просто вывод - DONE
select * 
from customer 
where first_name='KELLY' or first_name='WILLIE' and active=1;

#task 4 - отредактированный вывод - 
select first_name, last_name,
	   replace (lower(first_name), 'll', 'pp'),
       replace (lower(last_name), 'll', 'pp') 
from customer 
where first_name='KELLY' or first_name='WILLIE' and active=1;


# task 1 - DONE
select distinct district
from address
where district like 'K%a' AND district not like '% %';

#task 2 - DONE
select * 
from payment
where payment_date >= '2005-06-15 00:00:00' AND payment_date < '2005-06-19 00:00:00' AND amount > 10;

#task 3 - DONE
select *
from rental
order by rental_date
desc
limit 5;


