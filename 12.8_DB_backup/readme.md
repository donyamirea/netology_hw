# Домашнее задание к занятию "`12.8 Резервное копирование - Балашов Денис`"
   
### Задание 1. Резервное копирование
Кейс
Финансовая компания решила увеличить надёжность работы баз данных и их резервного копирования.
Необходимо описать, какие варианты резервного копирования подходят в случаях:
1.1. Необходимо восстанавливать данные в полном объёме за предыдущий день.
1.2. Необходимо восстанавливать данные за час до предполагаемой поломки.

Приведите ответ в свободной форме.

## Ответ
1.1 Считаю, что можно использовать как полный бэкап, который делается, например, в ночь (100% нерабочее время), так и инкрементный. Думаю, финансовая компания не станет сильно экономить на сохранности данных, потому полный бэкап выглядит более удобным. В ситуации "сломалось в проде посреди рабочего дня, нужно восстановить как можно скорее" так и так нужно будет восстанавливать полный бэкап, какой бы тип резервного копирования бы не использовался (мы же не рассматриваем переключение на резервные ноды и "спокойное" восстановление данных на упавшей ноде, верно?).

1.2 В данном случае необходимо использовать дифференциальный бэкап - его создание займет в разы меньше времени, чем создание полного бэкапа посреди рабочего дня, а также его восстановление займет (предположительно) меньше времени (во всяком случае, это будет проще) по сравнению с инкрементальным (я не работал с таким типом бэкапирования, не знаю, есть ли инструменты, позволяющие восстанавливать цепочку автоматически, но если рассматривать такое восстановление руками, то человеческий фактор (ошибка админа) здесь будет очень важен).

---

### Задание 2. PostgreSQL
2.1. С помощью официальной документации приведите пример команды резервирования данных и восстановления БД (pgdump/pgrestore).

Приведите ответ в свободной форме.

- dump
[pg_dump dbname > dumpfile](https://www.postgresql.org/docs/current/backup-dump.html)
- To support convenient dumping of the entire contents of a database cluster, the pg_dumpall program is provided
[pg_dumpall > dumpfile](https://www.postgresql.org/docs/current/backup-dump.html)
- dump and compress
[pg_dump dbname | gzip > filename.gz](https://www.postgresql.org/docs/current/backup-dump.html)
- pg_dump's custom dump format
[pg_dump -Fc dbname > filename](https://www.postgresql.org/docs/current/backup-dump.html)

- restore
[psql dbname < dumpfile](https://www.postgresql.org/docs/current/backup-dump.html)
- restore from compressed
[gunzip -c filename.gz | psql dbname](https://www.postgresql.org/docs/current/backup-dump.html)
- pg_dump's custom dump format
[pg_restore -d dbname filename](https://www.postgresql.org/docs/current/backup-dump.html)


---
### Задание 3. MySQL
3.1. С помощью официальной документации приведите пример команды инкрементного резервного копирования базы данных MySQL.

Приведите ответ в свободной форме.

## Ответ
[В оффициальной доке](https://dev.mysql.com/doc/mysql-enterprise-backup/8.0/en/mysqlbackup.incremental.html) есть указания на использование mysqlbackup, но такого испольняемого файла нет вместе с установкой 8 версии. Есть 'mysqldump'

`Related mysqlbackup options are --incremental, --incremental-with-redo-log-only, --incremental-backup-dir, --incremental-base, and --start-lsn.`
Параметры выше не подходят для 'mysqldump'. Есть пример:

```sql
mysqlbackup --defaults-file=/home/dbadmin/my.cnf \
  --incremental --incremental-base=history:last_backup \
  --backup-dir=/home/dbadmin/temp_dir \
  --backup-image=incremental_image1.bi \
   backup-to-image
```
Но задание даже одного '--incremental' параметра для 'mysqldump' приводит к ошибке:

```log
╰─❯ .\mysqldump.exe --incremental
mysqldump: [ERROR] unknown option '--incremental'.
```

Вот, что лежит у меня в виндовом каталоге: 

```log
╭─ pwsh  C:\Program Files\MySQL\MySQL Server 8.0\bin                         11:05:16 
╰─❯ ls | grep .exe
-a---        16.12.2022      9:21        6422120 п¬“  ibd2sdi.exe
-a---        16.12.2022      9:21        6411376 п¬“  innochecksum.exe
-a---        16.12.2022      9:21        6353016 п¬“  lz4_decompress.exe
-a---        16.12.2022      9:23        6286464 п¬“  my_print_defaults.exe
-a---        16.12.2022      9:22        6544504 п¬“  myisam_ftdump.exe
-a---        16.12.2022      9:22        6661232 п¬“  myisamchk.exe
-a---        16.12.2022      9:22        6504560 п¬“  myisamlog.exe
-a---        16.12.2022      9:22        6566000 п¬“  myisampack.exe
-a---        16.12.2022      9:23        6300800 п¬“  mysql_config_editor.exe
-a---        16.12.2022      9:23        7294088 п¬“  mysql_migrate_keyring.exe
-a---        16.12.2022      9:23        7199376 п¬“  mysql_secure_installation.exe
-a---        16.12.2022      9:23        6325888 п¬“  mysql_ssl_rsa_setup.exe
-a---        16.12.2022      9:23        6233728 п¬“  mysql_tzinfo_to_sql.exe
-a---        16.12.2022      9:23        7298168 п¬“  mysql_upgrade.exe
-a---        16.12.2022      9:22        7324776 п¬“  mysql.exe
-a---        16.12.2022      9:22        7212144 п¬“  mysqladmin.exe
-a---        16.12.2022      9:22        7565936 п¬“  mysqlbinlog.exe
-a---        16.12.2022      9:22        7219312 п¬“  mysqlcheck.exe
-a---        16.12.2022      9:22       54815848 п¬“  mysqld.exe
-a---        16.12.2022      9:22        7284848 п¬“  mysqldump.exe
-a---        16.12.2022      9:22        7203952 п¬“  mysqlimport.exe
-a---        16.12.2022      9:22        7719536 п¬“  mysqlpump.exe
-a---        16.12.2022      9:22        6313088 п¬“  mysqlrouter_keyring.exe
-a---        16.12.2022      9:23        6284928 п¬“  mysqlrouter_passwd.exe
-a---        16.12.2022      9:23        6269064 п¬“  mysqlrouter_plugin_info.exe
-a---        16.12.2022      9:22        7732848 п¬“  mysqlrouter.exe
-a---        16.12.2022      9:23        7201904 п¬“  mysqlshow.exe
-a---        16.12.2022      9:23        7221360 п¬“  mysqlslap.exe
-a---        16.12.2022      9:23        7163496 п¬“  perror.exe
-a---        16.12.2022      9:24        6253176 п¬“  zlib_decompress.exe
```

[Статья](https://snapshooter.com/learn/mysql/mysql-incremental-backup) говорит, что для создания инкрементального архива необходимо:
- включить бинарное логирование (enable binary logging)
- выполнить полный бэкап с параметром '--flush-logs'
- выполнить `mysqladmin -uroot -p flush-logs` и сохранить бинарные логи, созданные после создания последнего полного бэкапа
