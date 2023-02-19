# Домашнее задание к занятию "`13.1 Уязвимости и таки на информационные системы - Балашов Денис`"
   
### Задание 1
Скачайте и установите виртуальную машину Metasploitable: https://sourceforge.net/projects/metasploitable/.
Это типовая ОС для экспериментов в области информационной безопасности, с которой следует начать при анализе уязвимостей.
Просканируйте эту виртуальную машину, используя nmap.
Попробуйте найти уязвимости, которым подвержена эта виртуальная машина.
Сами уязвимости можно поискать на сайте https://www.exploit-db.com/.
Для этого нужно в поиске ввести название сетевой службы, обнаруженной на атакуемой машине, и выбрать подходящие по версии уязвимости.
Ответьте на следующие вопросы:
- Какие сетевые службы в ней разрешены?
- Какие уязвимости были вами обнаружены? (список со ссылками: достаточно трёх уязвимостей)
Приведите ответ в свободной форме.

```
1. Вывод 'nmap -sV <target>:

PORT     STATE SERVICE     VERSION
21/tcp   open  ftp         vsftpd 2.3.4
22/tcp   open  ssh         OpenSSH 4.7p1 Debian 8ubuntu1 (protocol 2.0)
23/tcp   open  telnet      Linux telnetd
25/tcp   open  smtp        Postfix smtpd
53/tcp   open  domain      ISC BIND 9.4.2
80/tcp   open  http        Apache httpd 2.2.8 ((Ubuntu) DAV/2)
111/tcp  open  rpcbind     2 (RPC #100000)
139/tcp  open  netbios-ssn Samba smbd 3.X - 4.X (workgroup: WORKGROUP)
445/tcp  open  netbios-ssn Samba smbd 3.X - 4.X (workgroup: WORKGROUP)
512/tcp  open  exec?       What is exec on port 512? - It is a service that allows you to execute a command inside a host if you know valid credentials (username and password)
513/tcp  open  login       rlogin - allows users to login to the host remotely
514/tcp  open  shell?      [Shell - used to execute non-interactive commands on a remote system (Remote Shell, rsh, remsh) ](https://ru.adminsub.net/tcp-udp-port-finder/514)
1099/tcp open  rmiregistry GNU Classpath grmiregistry
1524/tcp open  bindshell   Metasploitable root shell
2049/tcp open  nfs         2-4 (RPC #100003)
2121/tcp open  ftp         ProFTPD 1.3.1
3306/tcp open  mysql       MySQL 5.0.51a-3ubuntu5
5432/tcp open  postgresql  PostgreSQL DB 8.3.0 - 8.3.7
5900/tcp open  vnc         VNC (protocol 3.3)
6000/tcp open  X11         (access denied)
6667/tcp open  irc         UnrealIRCd
8009/tcp open  ajp13       Apache Jserv (Protocol v1.3)
8180/tcp open  http        Apache Tomcat/Coyote JSP engine 1.1

2. Уязвимости на основании сайта https://exploit-db.com:
[vsftpd 2.3.4 - Backdoor Command Execution](https://www.exploit-db.com/exploits/49757)
[PostgreSQL 8.3.6 - Conversion Encoding Remote Denial of Service](https://www.exploit-db.com/exploits/32849)
[OpenSSH 2.3 < 7.7 - Username Enumeration](https://www.exploit-db.com/exploits/45233)
```

---

### Задание 2
Проведите сканирование Metasploitable в режимах SYN, FIN, Xmas, UDP.
Запишите сеансы сканирования в Wireshark.
Ответьте на следующие вопросы:
- Чем отличаются эти режимы сканирования с точки зрения сетевого трафика?
- Как отвечает сервер?
Приведите ответ в свободной форме.

```
- Чем отличаются эти режимы сканирования с точки зрения сетевого трафика?
SYN: Вы посылаете SYN пакет, как если бы вы хотели установить реальное соединение и ждете. Ответы SYN/ACK указывают на то, что порт прослушивается (открыт), а RST (сброс) на то, что не прослушивается. 
FIN: устанавливается бит TCP "FIN". Если в ответ приходит RST пакет, то порт считается закрытым, отсутствие ответа означает, что порт открыт|фильтруется.
Xmas: Устанавливаются FIN, PSH и URG флаги. Если в ответ приходит RST пакет, то порт считается закрытым, отсутствие ответа означает, что порт открыт|фильтруется.
UDP: UDP сканирование работает путем посылки пустого (без данных) UDP заголовка на каждый целевой порт. Если в ответ приходит ICMP ошибка о недостижимости порта (тип 3, код 3), значит порт закрыт. Другие ICMP ошибки недостижимости (тип 3, коды 1, 2, 9, 10 или 13) указывают на то, что порт фильтруется. Иногда, служба будет отвечать UDP пакетом, указывая на то, что порт открыт. Это означает, что порт может быть открыт, или, возможно, пакетный фильтр блокирует его. Функция определения версии (-sV) может быть полезна для дифференциации действительно открытых портов и фильтруемых.

- Как отвечает сервер?
Учитывая, что время сканирования там наловилась разная куча всего, а я не работал с этим ранее, то:
SYN: присылает то ответный SYN (порт открыт), то RST (порт закрыт)
FIN: присылает то RST (преимущественно; порт закрыт), то ACK пакет, но без бита FIN (хотя должно...). Видимо, соединение разрывается nmap'ом.
UDP: в большей степени (не держал долго это сканирование) приходит подтверждение об открытом порте.
Xmas: чуть больше половины сообщений приходили пакеты с флагами, подтверждающими открытое состояние порта (3 флага: FIN, PSH, URG )
```
