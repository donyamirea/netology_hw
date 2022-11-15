# Используем как основу последний образ Debian
FROM debian:latest
# Указываем создателя имиджа
MAINTAINER Balashov Denis
# Указываем версию
LABEL version="1.0"
# Указываем команду, которая будет выполнена при сборке контейнера
RUN DEBIAN_FRONTEND="noninteractive" apt install -y tzdata && apt update && apt install -y apache2 nano
# Копируем файл внутрь нашего контейнера
COPY ./index.html /var/www/html/index.html
# Включаем возможность прокидывать трафик на 80 TCP-порт
EXPOSE 80/tcp
# Запускаем апач
CMD apachectl -D FOREGROUND
