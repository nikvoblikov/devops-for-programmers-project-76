### Hexlet tests and linter status:
[![Actions Status](https://github.com/nikvoblikov/devops-for-programmers-project-76/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/nikvoblikov/devops-for-programmers-project-76/actions)

## Перед началом работы

Проверьте, есть ли у вас модуль ansible для работы с докером:
```bash
ansible-doc docker_image
```

Если появилась документация, то модуль есть. В противном случае установите модуль:
```bash
ansible-galaxy collection install community.docker 
```

После этого можно запустить команду из `Makefile` для подготовки вэб-серверов и установки пакетного менеджера `pip` и `docker`.

Установите необходимые роли локально:
```bash
make pre-install
```

Мы предполагаем деплой на yandex cloud. Подготовьте всю инфрастукруту на стороне облака. Подключтесь к своим виртуальным машинам по ssh.
После чего подготовьте их, запустив команду:
```bash
make prepare-servers
```

## Деплой приложения Redmine на удаленный сервер

Создайте `vault.yml` файл из шаблона, запустив команду:
```bash
make vault
```

Внесите необходимые переменные для подключения к своей базе данных. Для проекта я выбрал базу [MySql](https://yandex.cloud/ru/docs/managed-mysql/)

Пример заполнения:
```
REDMINE_DB_USERNAME: redmine
REDMINE_DB_PASSWORD: redmine
REDMINE_DB_MYSQL: <host-name>.mdb.yandexcloud.net
REDMINE_DB_DATABASE: db1
```

После чего зашифруйте файл `vault.yml` с паролем:
```bash
make vault-encrypt
```

Теперь можно задеплоить приложение:
```bash
make deploy
```

## Документация Yandex cloud

[Yandex Compute Cloud](https://yandex.cloud/ru/docs/compute)
[Yandex Application Load Balancer](https://yandex.cloud/ru/docs/application-load-balancer)
[Yandex Virtual Private Cloud](https://yandex.cloud/ru/docs/vpc)
[Yandex Managed Service for MySQL](https://yandex.cloud/ru/docs/managed-mysql)