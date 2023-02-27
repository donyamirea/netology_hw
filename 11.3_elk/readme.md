# Домашнее задание к занятию "`13.1 ELK - Балашов Денис`"
   
### Задание 1. Elasticsearch
Установите и запустите Elasticsearch, после чего поменяйте параметр cluster_name на случайный.

Приведите скриншот команды 'curl -X GET 'localhost:9200/_cluster/health?pretty', сделанной на сервере с установленным Elasticsearch. Где будет виден нестандартный cluster_name.

## Ответ
Делал через https://opensearch.org
curl проходить не хотел, сделал запрос через вебку 

![image](https://user-images.githubusercontent.com/117297288/221481559-877eb66c-92dc-4478-96ce-7e01712068ab.png)

---

### Задание 2. Kibana
Установите и запустите Kibana.

Приведите скриншот интерфейса Kibana на странице http://<ip вашего сервера>:5601/app/dev_tools#/console, где будет выполнен запрос GET /_cluster/health?pretty.

## Ответ
Делал через опенсерч, у них в "простой" установке идет свой дешборд
запросик 'health' и 'health?pretty'

![image](https://user-images.githubusercontent.com/117297288/221481559-877eb66c-92dc-4478-96ce-7e01712068ab.png)

---
### Задание 3. Logstash
Установите и запустите Logstash и Nginx. С помощью Logstash отправьте access-лог Nginx в Elasticsearch.

Приведите скриншот интерфейса Kibana, на котором видны логи Nginx.

`Ответ [ссылка на источник|скриншот (можно добавлять через гитхаб - автоматом генерится линк)](http://example.com)`
---
### Задание 4. Filebeat
Установите и запустите Filebeat. Переключите поставку логов Nginx с Logstash на Filebeat.

Приведите скриншот интерфейса Kibana, на котором видны логи Nginx, которые были отправлены через Filebeat.

`Ответ [ссылка на источник|скриншот (можно добавлять через гитхаб - автоматом генерится линк)](http://example.com)`