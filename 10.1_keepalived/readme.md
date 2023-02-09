# Домашнее задание к занятию "`10.1 Keepalived/vrrp - Балашов Денис`"
   
### Задание 1
Разверните топологию из лекции и выполните установку и настройку сервиса Keepalived.
```
vrrp_instance test {
state "name_mode"
interface "name_interface"
virtual_router_id "number id"
priority "number priority"
advert_int "number advert"
authentication {
auth_type "auth type"
auth_pass "password"
}
unicast_peer {
"ip address host"
}
virtual_ipaddress {
"ip address host" dev "interface" label "interface":vip
}
}
```
Пришлите скриншот рабочей конфигурации и состояния сервиса для каждого нода.

![image](https://user-images.githubusercontent.com/117297288/217889064-2d3f287e-a0ae-46a3-b91a-e2ca457b3367.png)
