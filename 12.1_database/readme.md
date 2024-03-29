# Домашнее задание к занятию "`12.1 Базы даных - Балашов Денис`"

Легенда
Заказчик передал вам [файл](https://github.com/netology-code/sdb-homeworks/blob/main/resources/hw-12-1.xlsx) в формате Excel, в котором сформирован отчёт.

На основе этого отчёта нужно выполнить следующие задания.

### Задание 1
Опишите не менее семи таблиц, из которых состоит база данных:

- какие данные хранятся в этих таблицах;
- какой тип данных у столбцов в этих таблицах, если данные хранятся в PostgreSQL.
Приведите решение к следующему виду:

Сотрудники (
- идентификатор, первичный ключ, serial,
- фамилия varchar(50),
- ...
- идентификатор структурного подразделения, внешний ключ, integer).

## Ответ
1. Сотрудники 
- id[smallint]
- фио[text]
- id_даты_найма
- id_филиала
- дата найма[date]
2. Структурные подразделения
- id[smallint]
- имя[text]
- id_типа_подразделения
3. Тип подразделения 
- id[smallint]
- имя[text]
4. Филиалы 
- id[smallint]
- адрес[text]
5. Проекты
- id[smallint]
- имя[text])
6. Должности
- id[smallint]
- id_структурного_подразделения
7. Состав структурного подразделения
- id[smallint]
- id_структурного_подразделения
- имя_структурного подразделения
- id_сотрудника
- фио_сотрудника
 
Тип данных брал из [документации](https://www.postgresql.org/docs/current/datatype.html)