# Домашнее задание к занятию "`10.3 Pacemaker - Балашов Денис`"
   
### Задание 1
Опишите основные функции и назначение Pacemaker.
Приведите ответ в свободной форме.

`Управляет всеми ресурсами кластера и сервисами на конечных узлах`
---

### Задание 2
Опишите основные функции и назначение Corosync.
Приведите ответ в свободной форме.

`Как я понял, он работает с приложениями на узлах: следит за состоянием, передает им информацию об активности/статусе узлов кластера и пр.`
---
### Задание 3
Соберите модель, состоящую из двух виртуальных машин. Установите Pacemaker, Corosync, Pcs. Настройте HA кластер.
Пришлите скриншот рабочей конфигурации и состояния сервиса для каждого нода.

![image](https://user-images.githubusercontent.com/117297288/219164150-95cbb081-b0bf-43b9-b2d5-f073ee98859f.png)

C адресами в хостах начудил, но у меня были проблемы с pcs...
В целом использовал виртуальные сети 10.10.0.0/24 и 10.10.1.0/24.
Адреса для 'www' и 'mysql' из примера в лекции взял *.100 и *.200 соответственно.

![image](https://user-images.githubusercontent.com/117297288/219164785-c9f9db94-515b-49db-b758-7cf391cfa5d8.png)
