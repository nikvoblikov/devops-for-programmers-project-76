### Hexlet tests and linter status:
[![Actions Status](https://github.com/nikvoblikov/devops-for-programmers-project-76/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/nikvoblikov/devops-for-programmers-project-76/actions)

## Перед началом работы.

Проверьте, есть ли у вас модуль ansible для работы с докером:
```bash
ansible_doc docker_image
```

Если появилась документация, то моель есть. В противном случае установите модуль:
```bash
ansible-galaxy collection install community.docker 
```

После этого можно запустить команду из `Makefile` для подготовки вэб-серверов и установки пакетного менеджера `pip` и `docker`.

Установите необходимые роли локально:
```bash
make pre-install
```

После чего установите на удаленне серверы:
```bash
make prepare-servers
```

```bash
```