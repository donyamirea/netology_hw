# Домашнее задание к занятию "`12.6 Репликация и масштабиролвание. Часть 1  - Балашов Денис`"
   
### Задание 1
На лекции рассматривались режимы репликации master-slave, master-master, опишите их различия.

- master-slave: мастер, он же главный сервер, позволяет считывать и записывать в себя данные; подчиненный копирует данные с мастера (синхронизируется) и позволяет только читать с себя данные.
- master-master: каждый сервер является мастером и подчиненным одновременно, что значит, что можно писать/изменять информацию на всех серверах одновременно.

---

### Задание 2
Выполните конфигурацию master-slave репликации, примером можно пользоваться из лекции.
Приложите скриншоты конфигурации, выполнения работы: состояния и режимы работы серверов.

![image](https://user-images.githubusercontent.com/117297288/221358181-99ccc71f-fd65-460e-bde6-1adf5cdd5e93.png)

![image](https://user-images.githubusercontent.com/117297288/221358033-500118d6-0c8a-4206-a670-08ba8e6f8679.png)

Делал также на centos 7, после настройки подчиненного была проблема с коннектом на 3306 порт. Решилось созданием правила на мастере

![image](https://user-images.githubusercontent.com/117297288/221358097-0d96d583-f071-40bb-9b03-9df7be976abf.png)
