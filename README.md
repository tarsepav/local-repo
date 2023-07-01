# Локальный репозиторий RPM пакетов.

## Состав:
  - Сервер докер контейнер
  - Клиент докер контейнер

## Автоматическое разворачивание через docker-compose up:
1. Собирает образ сервера из докерфайла (/docker/server/Dockerfile)
1. Запускает контейнер из образа сервера
1. При запуске монтирует том с готовыми rpm пакетами(docker/repos/)	
1. Монтирует конфиг файл репозитория для контейнера клиента (/docker/client/local.repo)
1. Собирает образ клиента из докерфайла (/docker/client/Dockerfile)
1. Запускает контейнер из образа клиента
	
Для доступа к контейнерам на них копируется ssh.pub ключ. Закрытый ключ в директории проекта /ssh/id_rsa

При запуске cервер контейнера в него монтируется директория с rpm пакетами. 

Добавлять новые пакеты на Сервер контейнер можно по ssh с помощью команды 

>scp [путь к файлу] [имя пользователя]@[имя сервера/ip-адрес]:[путь к файлу]

Удалить пакет 

>ssh -n [имя пользователя]@[имя сервера/ip-адрес] rm [путь к файлу]

Просмотр логов nginx и sshd
>docker-compose logs

Автоматическая проверка доступности nginx сервера через healthcheck, каждые 30с, без перезапуска контейнера.
