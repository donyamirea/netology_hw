# Домашнее задание к занятию "`13.1 ELK - Балашов Денис`"
   
### Задание 1. Elasticsearch
Установите и запустите Elasticsearch, после чего поменяйте параметр cluster_name на случайный.

Приведите скриншот команды 'curl -X GET 'localhost:9200/_cluster/health?pretty', сделанной на сервере с установленным Elasticsearch. Где будет виден нестандартный cluster_name.

## Ответ
Делал через https://opensearch.org

С ним было все не совсем так:

```shell
root@deb10:~# curl -XGET https://localhost:9200/_cluster/health?pretty=true -u admin:admin --insecure
{
  "cluster_name" : "my-cluster",
  "status" : "green",
  "timed_out" : false,
  "number_of_nodes" : 2,
  "number_of_data_nodes" : 2,
  "discovered_master" : true,
  "discovered_cluster_manager" : true,
  "active_primary_shards" : 4,
  "active_shards" : 8,
  "relocating_shards" : 0,
  "initializing_shards" : 0,
  "unassigned_shards" : 0,
  "delayed_unassigned_shards" : 0,
  "number_of_pending_tasks" : 0,
  "number_of_in_flight_fetch" : 0,
  "task_max_waiting_in_queue_millis" : 0,
  "active_shards_percent_as_number" : 100.0
}
root@deb10:~#
```


---

### Задание 2. Kibana
Установите и запустите Kibana.

Приведите скриншот интерфейса Kibana на странице http://<ip вашего сервера>:5601/app/dev_tools#/console, где будет выполнен запрос GET /_cluster/health?pretty.

## Ответ
Делал через опенсерч, у них в "простой" установке идет свой дешборд.
Запросик 'health' и 'health?pretty', на первый взгляд, не различаются..

![image](https://user-images.githubusercontent.com/117297288/221481559-877eb66c-92dc-4478-96ce-7e01712068ab.png)

---
### Задание 3. Logstash
Установите и запустите Logstash и Nginx. С помощью Logstash отправьте access-лог Nginx в Elasticsearch.

Приведите скриншот интерфейса Kibana, на котором видны логи Nginx.

![image](https://user-images.githubusercontent.com/117297288/221532766-fd33aac6-1016-433a-956b-c4007f054a7e.png)


---
### Задание 4. Filebeat
Установите и запустите Filebeat. Переключите поставку логов Nginx с Logstash на Filebeat.

Приведите скриншот интерфейса Kibana, на котором видны логи Nginx, которые были отправлены через Filebeat.

`Ответ [ссылка на источник|скриншот (можно добавлять через гитхаб - автоматом генерится линк)](http://example.com)`
