# Установить необходимые роли
pre-install:
	ansible-galaxy install -r requirements.yml

# Установка необходимых пакетов на удаленные серверы
prepare-servers:
	ansible-playbook -i inventory.ini playbook.yml -t prepare-servers

# Создать vault.yml файл
vault:
	cp -n ./group_vars/webservers/vault.example ./group_vars/webservers/vault.yml || true
	@echo "✅ vault.yml checked (created if not exists)"

# Зашифровать файл vault.yml
vault-encrypt:
	ansible-vault encrypt group_vars/webservers/vault.yml

# Деплой приложения
deploy:
	ansible-playbook -i inventory.ini playbook.yml -t install-redmine --ask-vault-pass