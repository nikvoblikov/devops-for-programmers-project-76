# Установить необходимые роли
pre-install:
	ansible-galaxy install -r requirements.yml

# Установка необходимых пакетов на удаленные серверы
prepare-servers:
	ansible-playbook -i inventory.ini playbook.yml -t prepare-servers
	