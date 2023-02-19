# Домашнее задание к занятию "`13.3 Защита сети - Балашов Денис`"
   
### Подготовка
Подготовка защищаемой системы:
установите Suricata,
установите Fail2Ban.
Подготовка системы злоумышленника: установите nmap и thc-hydra либо скачайте и установите Kali linux.
Обе системы должны находится в одной подсети.

---

### Задание 1
Проведите разведку системы и определите, какие сетевые службы запущены на защищаемой системе:
- sudo nmap -sA < ip-адрес >
- sudo nmap -sT < ip-адрес >
- sudo nmap -sS < ip-адрес >
- sudo nmap -sV < ip-адрес >

По желанию можете поэкспериментировать с опциями: https://nmap.org/man/ru/man-briefoptions.html.
В качестве ответа пришлите события, которые попали в логи Suricata и Fail2Ban, прокомментируйте результат.

```
В логе 'suricata.log' невнятная дичь с ошибками/предупреждениями:
19/2/2023 -- 12:13:43 - <Notice> - all 1 packet processing threads, 4 management threads initialized, engine started.
19/2/2023 -- 12:13:43 - <Error> - [ERRCODE: SC_ERR_AFP_CREATE(190)] - Unable to find iface eth0: No such device
19/2/2023 -- 12:13:43 - <Error> - [ERRCODE: SC_ERR_AFP_CREATE(190)] - Couldn't init AF_PACKET socket, fatal error
19/2/2023 -- 12:13:43 - <Error> - [ERRCODE: SC_ERR_FATAL(171)] - thread W#01-eth0 failed
19/2/2023 -- 12:13:43 - <Notice> - This is Suricata version 4.1.2 RELEASE
19/2/2023 -- 12:13:47 - <Warning> - [ERRCODE: SC_WARN_FLOWBIT(306)] - flowbit 'et.http.PK' is checked but not set. Checked in 2019835 and 3 other sigs
19/2/2023 -- 12:13:47 - <Warning> - [ERRCODE: SC_WARN_FLOWBIT(306)] - flowbit 'HTTP.UncompressedFlash' is checked but not set. Checked in 2018428 and 1 other sigs
19/2/2023 -- 12:13:47 - <Warning> - [ERRCODE: SC_WARN_FLOWBIT(306)] - flowbit 'et.WinHttpRequest' is checked but not set. Checked in 2019822 and 1 other sigs
19/2/2023 -- 12:13:47 - <Warning> - [ERRCODE: SC_WARN_FLOWBIT(306)] - flowbit 'ET.wininet.UA' is checked but not set. Checked in 2021312 and 0 other sigs
19/2/2023 -- 12:13:47 - <Warning> - [ERRCODE: SC_WARN_FLOWBIT(306)] - flowbit 'et.MS.XMLHTTP.ip.request' is checked but not set. Checked in 2022050 and 1 other sigs
19/2/2023 -- 12:13:47 - <Warning> - [ERRCODE: SC_WARN_FLOWBIT(306)] - flowbit 'et.MS.XMLHTTP.no.exe.request' is checked but not set. Checked in 2022053 and 0 other sigs
19/2/2023 -- 12:13:47 - <Warning> - [ERRCODE: SC_WARN_FLOWBIT(306)] - flowbit 'et.MS.WinHttpRequest.no.exe.request' is checked but not set. Checked in 2022653 and 0 other sigs
19/2/2023 -- 12:13:47 - <Warning> - [ERRCODE: SC_WARN_FLOWBIT(306)] - flowbit 'et.IE7.NoRef.NoCookie' is checked but not set. Checked in 2023671 and 9 other sigs
19/2/2023 -- 12:13:47 - <Warning> - [ERRCODE: SC_WARN_FLOWBIT(306)] - flowbit 'ET.pdf.in.http' is checked but not set. Checked in 2017150 and 3 other sigs
19/2/2023 -- 12:13:47 - <Warning> - [ERRCODE: SC_WARN_FLOWBIT(306)] - flowbit 'ET.gocd.auth' is checked but not set. Checked in 2034333 and 0 other sigs
19/2/2023 -- 12:13:47 - <Warning> - [ERRCODE: SC_WARN_FLOWBIT(306)] - flowbit 'dcerpc.rpcnetlogon' is checked but not set. Checked in 2030870 and 6 other sigs
19/2/2023 -- 12:13:47 - <Warning> - [ERRCODE: SC_WARN_FLOWBIT(306)] - flowbit 'ET.BonitaDefaultCreds' is checked but not set. Checked in 2036817 and 0 other sigs
19/2/2023 -- 12:13:47 - <Warning> - [ERRCODE: SC_WARN_FLOWBIT(306)] - flowbit 'et.MCOFF' is checked but not set. Checked in 2019837 and 1 other sigs
19/2/2023 -- 12:13:47 - <Warning> - [ERRCODE: SC_WARN_FLOWBIT(306)] - flowbit 'min.gethttp' is checked but not set. Checked in 2023711 and 0 other sigs
19/2/2023 -- 12:13:47 - <Warning> - [ERRCODE: SC_WARN_FLOWBIT(306)] - flowbit 'ET.armwget' is checked but not set. Checked in 2024241 and 1 other sigs
19/2/2023 -- 12:13:47 - <Warning> - [ERRCODE: SC_WARN_FLOWBIT(306)] - flowbit 'ET.tcpraw.png' is checked but not set. Checked in 2035477 and 0 other sigs
19/2/2023 -- 12:13:47 - <Warning> - [ERRCODE: SC_WARN_FLOWBIT(306)] - flowbit 'ET.JS.Obfus.Func' is checked but not set. Checked in 2017247 and 0 other sigs
19/2/2023 -- 12:13:47 - <Warning> - [ERRCODE: SC_WARN_FLOWBIT(306)] - flowbit 'et.JavaArchiveOrClass' is checked but not set. Checked in 2017768 and 9 other sigs
19/2/2023 -- 12:13:57 - <Error> - [ERRCODE: SC_ERR_AFP_CREATE(190)] - Unable to find type for iface "eth0": No such device
19/2/2023 -- 12:13:57 - <Notice> - all 1 packet processing threads, 4 management threads initialized, engine started.
19/2/2023 -- 12:13:57 - <Error> - [ERRCODE: SC_ERR_AFP_CREATE(190)] - Unable to find iface eth0: No such device
19/2/2023 -- 12:13:57 - <Error> - [ERRCODE: SC_ERR_AFP_CREATE(190)] - Couldn't init AF_PACKET socket, fatal error
19/2/2023 -- 12:13:57 - <Error> - [ERRCODE: SC_ERR_FATAL(171)] - thread W#01-eth0 failed

Видимо, нужно глубокое погружение в конфиг, но в рамках данного задания это не предполагается.
---

В логе 'stats.log' перечислина статистика, видимо, различных сетевых событий, среди которых выделяется:
detect.alert                               | Total                     | 14
Видимо, на основании этой статистики можно проводить анализ по принятию мер защиты.

---

В логе 'fast.log' видим:
02/19/2023-12:11:40.289958  [**] [1:2010937:3] ET SCAN Suspicious inbound to mySQL port 3306 [**] [Classification: Potentially Bad Traffic] [Priority: 2] {TCP} 192.168.0.19:39880 -> 192.168.0.13:3306
02/19/2023-12:11:40.300805  [**] [1:2002911:6] ET SCAN Potential VNC Scan 5900-5920 [**] [Classification: Attempted Information Leak] [Priority: 2] {TCP} 192.168.0.19:41468 -> 192.168.0.13:5902
02/19/2023-12:11:40.305195  [**] [1:2010936:3] ET SCAN Suspicious inbound to Oracle SQL port 1521 [**] [Classification: Potentially Bad Traffic] [Priority: 2] {TCP} 192.168.0.19:51882 -> 192.168.0.13:1521
02/19/2023-12:11:40.313980  [**] [1:2010939:3] ET SCAN Suspicious inbound to PostgreSQL port 5432 [**] [Classification: Potentially Bad Traffic] [Priority: 2] {TCP} 192.168.0.19:57334 -> 192.168.0.13:5432
02/19/2023-12:11:40.314422  [**] [1:2002910:6] ET SCAN Potential VNC Scan 5800-5820 [**] [Classification: Attempted Information Leak] [Priority: 2] {TCP} 192.168.0.19:38568 -> 192.168.0.13:5811
02/19/2023-12:11:40.316473  [**] [1:2010935:3] ET SCAN Suspicious inbound to MSSQL port 1433 [**] [Classification: Potentially Bad Traffic] [Priority: 2] {TCP} 192.168.0.19:56776 -> 192.168.0.13:1433
02/19/2023-12:11:44.858864  [**] [1:2010937:3] ET SCAN Suspicious inbound to mySQL port 3306 [**] [Classification: Potentially Bad Traffic] [Priority: 2] {TCP} 192.168.0.19:45548 -> 192.168.0.13:3306
02/19/2023-12:11:44.863073  [**] [1:2010935:3] ET SCAN Suspicious inbound to MSSQL port 1433 [**] [Classification: Potentially Bad Traffic] [Priority: 2] {TCP} 192.168.0.19:45548 -> 192.168.0.13:1433
02/19/2023-12:11:44.885277  [**] [1:2010939:3] ET SCAN Suspicious inbound to PostgreSQL port 5432 [**] [Classification: Potentially Bad Traffic] [Priority: 2] {TCP} 192.168.0.19:45548 -> 192.168.0.13:5432
02/19/2023-12:11:44.897307  [**] [1:2010936:3] ET SCAN Suspicious inbound to Oracle SQL port 1521 [**] [Classification: Potentially Bad Traffic] [Priority: 2] {TCP} 192.168.0.19:45548 -> 192.168.0.13:1521
02/19/2023-12:11:48.598174  [**] [1:2010937:3] ET SCAN Suspicious inbound to mySQL port 3306 [**] [Classification: Potentially Bad Traffic] [Priority: 2] {TCP} 192.168.0.19:40382 -> 192.168.0.13:3306
02/19/2023-12:11:49.700851  [**] [1:2010936:3] ET SCAN Suspicious inbound to Oracle SQL port 1521 [**] [Classification: Potentially Bad Traffic] [Priority: 2] {TCP} 192.168.0.19:40382 -> 192.168.0.13:1521
02/19/2023-12:11:49.710836  [**] [1:2010939:3] ET SCAN Suspicious inbound to PostgreSQL port 5432 [**] [Classification: Potentially Bad Traffic] [Priority: 2] {TCP} 192.168.0.19:40382 -> 192.168.0.13:5432
02/19/2023-12:11:49.750905  [**] [1:2010935:3] ET SCAN Suspicious inbound to MSSQL port 1433 [**] [Classification: Potentially Bad Traffic] [Priority: 2] {TCP} 192.168.0.19:40382 -> 192.168.0.13:1433

Видно явное указание на подозрительные и потенциально вредоносные действия.
```

---
### Задание 2
Проведите атаку на подбор пароля для службы SSH:

hydra -L users.txt -P pass.txt < ip-адрес > ssh

Настройка hydra:
создайте два файла: users.txt и pass.txt;
в каждой строчке первого файла должны быть имена пользователей, второго — пароли. В нашем случае это могут быть случайные строки, но ради эксперимента можете добавить имя и пароль существующего пользователя.
Дополнительная информация по hydra: https://kali.tools/?p=1847.

Включение защиты SSH для Fail2Ban:
открыть файл /etc/fail2ban/jail.conf,
найти секцию ssh,
установить enabled в true.
Дополнительная информация по Fail2Ban:https://putty.org.ru/articles/fail2ban-ssh.html.

В качестве ответа пришлите события, которые попали в логи Suricata и Fail2Ban, прокомментируйте результат.

```
fail2ban:
2023-02-19 12:26:09,293 fail2ban.filter         [2881]: INFO    [sshd] Found 192.168.0.19 - 2023-02-19 12:26:07
2023-02-19 12:26:09,294 fail2ban.filter         [2881]: INFO    [sshd] Found 192.168.0.19 - 2023-02-19 12:26:08
2023-02-19 12:26:09,294 fail2ban.filter         [2881]: INFO    [sshd] Found 192.168.0.19 - 2023-02-19 12:26:08
2023-02-19 12:26:09,294 fail2ban.filter         [2881]: INFO    [sshd] Found 192.168.0.19 - 2023-02-19 12:26:08
2023-02-19 12:26:09,294 fail2ban.filter         [2881]: INFO    [sshd] Found 192.168.0.19 - 2023-02-19 12:26:08
2023-02-19 12:26:09,295 fail2ban.filter         [2881]: INFO    [sshd] Found 192.168.0.19 - 2023-02-19 12:26:08
2023-02-19 12:26:09,295 fail2ban.filter         [2881]: INFO    [sshd] Found 192.168.0.19 - 2023-02-19 12:26:08
2023-02-19 12:26:09,295 fail2ban.filter         [2881]: INFO    [sshd] Found 192.168.0.19 - 2023-02-19 12:26:08
2023-02-19 12:26:09,295 fail2ban.filter         [2881]: INFO    [sshd] Found 192.168.0.19 - 2023-02-19 12:26:08
2023-02-19 12:26:09,295 fail2ban.filter         [2881]: INFO    [sshd] Found 192.168.0.19 - 2023-02-19 12:26:08
2023-02-19 12:26:09,295 fail2ban.filter         [2881]: INFO    [sshd] Found 192.168.0.19 - 2023-02-19 12:26:08
2023-02-19 12:26:09,296 fail2ban.filter         [2881]: INFO    [sshd] Found 192.168.0.19 - 2023-02-19 12:26:08
2023-02-19 12:26:09,296 fail2ban.filter         [2881]: INFO    [sshd] Found 192.168.0.19 - 2023-02-19 12:26:08
2023-02-19 12:26:09,296 fail2ban.filter         [2881]: INFO    [sshd] Found 192.168.0.19 - 2023-02-19 12:26:08
2023-02-19 12:26:09,296 fail2ban.filter         [2881]: INFO    [sshd] Found 192.168.0.19 - 2023-02-19 12:26:08
2023-02-19 12:26:09,296 fail2ban.filter         [2881]: INFO    [sshd] Found 192.168.0.19 - 2023-02-19 12:26:08
2023-02-19 12:26:09,297 fail2ban.filter         [2881]: INFO    [sshd] Found 192.168.0.19 - 2023-02-19 12:26:08
2023-02-19 12:26:09,297 fail2ban.filter         [2881]: INFO    [sshd] Found 192.168.0.19 - 2023-02-19 12:26:08
2023-02-19 12:26:09,297 fail2ban.filter         [2881]: INFO    [sshd] Found 192.168.0.19 - 2023-02-19 12:26:08
2023-02-19 12:26:09,297 fail2ban.filter         [2881]: INFO    [sshd] Found 192.168.0.19 - 2023-02-19 12:26:08
2023-02-19 12:26:09,297 fail2ban.filter         [2881]: INFO    [sshd] Found 192.168.0.19 - 2023-02-19 12:26:08
2023-02-19 12:26:09,298 fail2ban.filter         [2881]: INFO    [sshd] Found 192.168.0.19 - 2023-02-19 12:26:08
2023-02-19 12:26:09,298 fail2ban.filter         [2881]: INFO    [sshd] Found 192.168.0.19 - 2023-02-19 12:26:08
2023-02-19 12:26:09,302 fail2ban.filter         [2881]: INFO    [sshd] Found 192.168.0.19 - 2023-02-19 12:26:08
2023-02-19 12:26:09,303 fail2ban.filter         [2881]: INFO    [sshd] Found 192.168.0.19 - 2023-02-19 12:26:08
2023-02-19 12:26:09,303 fail2ban.filter         [2881]: INFO    [sshd] Found 192.168.0.19 - 2023-02-19 12:26:08
2023-02-19 12:26:09,624 fail2ban.actions        [2881]: NOTICE  [sshd] Ban 192.168.0.19
2023-02-19 12:26:09,688 fail2ban.filter         [2881]: INFO    [sshd] Found 192.168.0.19 - 2023-02-19 12:26:09
2023-02-19 12:26:09,719 fail2ban.filter         [2881]: INFO    [sshd] Found 192.168.0.19 - 2023-02-19 12:26:09
2023-02-19 12:26:09,721 fail2ban.filter         [2881]: INFO    [sshd] Found 192.168.0.19 - 2023-02-19 12:26:09
2023-02-19 12:26:09,721 fail2ban.filter         [2881]: INFO    [sshd] Found 192.168.0.19 - 2023-02-19 12:26:09
2023-02-19 12:26:09,738 fail2ban.filter         [2881]: INFO    [sshd] Found 192.168.0.19 - 2023-02-19 12:26:09
2023-02-19 12:26:09,745 fail2ban.filter         [2881]: INFO    [sshd] Found 192.168.0.19 - 2023-02-19 12:26:09
2023-02-19 12:26:09,746 fail2ban.filter         [2881]: INFO    [sshd] Found 192.168.0.19 - 2023-02-19 12:26:09
2023-02-19 12:26:09,763 fail2ban.filter         [2881]: INFO    [sshd] Found 192.168.0.19 - 2023-02-19 12:26:09
2023-02-19 12:26:09,763 fail2ban.filter         [2881]: INFO    [sshd] Found 192.168.0.19 - 2023-02-19 12:26:09
2023-02-19 12:26:09,770 fail2ban.filter         [2881]: INFO    [sshd] Found 192.168.0.19 - 2023-02-19 12:26:09
2023-02-19 12:26:09,777 fail2ban.filter         [2881]: INFO    [sshd] Found 192.168.0.19 - 2023-02-19 12:26:09
2023-02-19 12:26:09,855 fail2ban.filter         [2881]: INFO    [sshd] Found 192.168.0.19 - 2023-02-19 12:26:09
2023-02-19 12:26:09,858 fail2ban.filter         [2881]: INFO    [sshd] Found 192.168.0.19 - 2023-02-19 12:26:09
2023-02-19 12:26:09,858 fail2ban.filter         [2881]: INFO    [sshd] Found 192.168.0.19 - 2023-02-19 12:26:09
2023-02-19 12:26:09,867 fail2ban.filter         [2881]: INFO    [sshd] Found 192.168.0.19 - 2023-02-19 12:26:09
2023-02-19 12:26:09,955 fail2ban.filter         [2881]: INFO    [sshd] Found 192.168.0.19 - 2023-02-19 12:26:09

Была 1 верная подборка пароля (я указал существующий пароль в файле 'pass.txt' пароль). Видимо, ее он и заблокировал.
---

Suricata
Я ее не включил перед выполнением "взлома", посему во 2 проверке меня забанили :D
Учитывая прошлые выводы логов, вероятно в логе 'fast.log' была бы информация о массовых попытках единовременного взлома ssh.
```
![image](https://user-images.githubusercontent.com/117297288/219940064-ed9be687-3f9c-4df3-86ff-e112bf64fffa.png)
