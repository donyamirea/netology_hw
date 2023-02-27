# Домашнее задание к занятию "`11.4 Очереди RabbitMQ - Балашов Денис`"
   
### Задание 1. Установка RabbitMQ
Используя Vagrant или VirtualBox, создайте виртуальную машину и установите RabbitMQ. Добавьте management plug-in и зайдите в веб-интерфейс.

Итогом выполнения домашнего задания будет приложенный скриншот веб-интерфейса RabbitMQ.

![image](https://user-images.githubusercontent.com/117297288/221564278-41de865f-75ef-4fc0-8af7-d5f119571097.png)


---

### Задание 2. Отправка и получение сообщений
Используя приложенные скрипты, проведите тестовую отправку и получение сообщения. Для отправки сообщений необходимо запустить скрипт producer.py.

Для работы скриптов вам необходимо установить Python версии 3 и библиотеку Pika. Также в скриптах нужно указать IP-адрес машины, на которой запущен RabbitMQ, заменив localhost на нужный IP.

`$ pip install pika`

Зайдите в веб-интерфейс, найдите очередь под названием hello и сделайте скриншот. После чего запустите второй скрипт consumer.py и сделайте скриншот результата выполнения скрипта

В качестве решения домашнего задания приложите оба скриншота, сделанных на этапе выполнения.

Для закрепления материала можете попробовать модифицировать скрипты, чтобы поменять название очереди и отправляемое сообщение.

![image](https://user-images.githubusercontent.com/117297288/221567242-2ea2367a-8577-461d-b508-21ea67854fcf.png)

![image](https://user-images.githubusercontent.com/117297288/221567441-afef46a0-f908-4bc9-bd9f-b03f82a81429.png)

![image](https://user-images.githubusercontent.com/117297288/221567336-de4e0393-63b4-41ad-8cc3-b69097801c37.png)


---
### Задание 3. Подготовка HA кластера
Используя Vagrant или VirtualBox, создайте вторую виртуальную машину и установите RabbitMQ.
Добавьте в файл hosts название и IP-адрес каждой машины, чтобы машины могли видеть друг друга по имени.

Пример содержимого hosts файла:
```shell script
$ cat /etc/hosts
192.168.0.10 rmq01
192.168.0.11 rmq02
```
После этого ваши машины могут пинговаться по имени.

Затем объедините две машины в кластер и создайте политику ha-all на все очереди.

1. *В качестве решения домашнего задания приложите скриншоты из веб-интерфейса с информацией о доступных нодах в кластере и включённой политикой.*

2. Также приложите вывод команды с двух нод:

```shell
$ rabbitmqctl cluster_status
```

3. Для закрепления материала снова запустите скрипт producer.py и приложите скриншот выполнения команды на каждой из нод:

```shell
$ rabbitmqadmin get queue='hello'
```

4. После чего попробуйте отключить одну из нод, желательно ту, к которой подключались из скрипта, затем поправьте параметры подключения в скрипте consumer.py на вторую ноду и запустите его.

## Ответ

1. ![image](https://user-images.githubusercontent.com/117297288/221571912-d4b197ab-6fe2-466d-a052-9842212729cf.png)

![image](https://user-images.githubusercontent.com/117297288/221572255-7dc17570-9bbb-4e79-9ccd-ca609d2d1227.png)

2. ![image](https://user-images.githubusercontent.com/117297288/221572345-e00b8493-8748-4a67-b5ec-136dbae15b45.png)

![image](https://user-images.githubusercontent.com/117297288/221572380-5b07d3b4-a3d3-43c0-8454-2c713d4d9fd8.png)

3. ![image](https://user-images.githubusercontent.com/117297288/221572547-72bba6e2-fd17-42b2-8e8f-cbfd8270d82d.png)

4. ![image](https://user-images.githubusercontent.com/117297288/221574508-aa10ca0b-188b-4652-98fb-c7ab39fd17fd.png)

```py
#!/usr/bin/env python3
# coding=utf-8
import pika
credentials = pika.PlainCredentials('bdi', 'qwe123')
connection = pika.BlockingConnection(pika.ConnectionParameters('192.168.0.18','5672', '/', credentials))
channel = connection.channel()
channel.queue_declare(queue='hello')
def callback(ch, method, properties, body):
  print(" [x] Received %r" % body)
channel.basic_consume(queue='hello', on_message_callback=callback, auto_ack=True)
channel.start_consuming()
```
