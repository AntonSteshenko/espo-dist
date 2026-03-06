.PHONY: up down restart logs shell rebuild clear-cache status clean upgrade deploy sync

# Avvia l'ambiente di sviluppo
up:
	docker compose up -d

# Ferma l'ambiente
down:
	docker compose down

# Riavvia i container
restart:
	docker compose restart

# Upgrade
upgrade:
	docker compose pull

# Mostra i log (follow mode)
logs:
	docker compose logs -f espocrm

# Shell nel container EspoCRM
shell:
	docker compose exec espocrm bash

# Rebuild cache (dopo modifiche PHP/metadata)
rebuild:
	docker compose exec espocrm php rebuild.php

# Clear cache
clear-cache:
	docker compose exec espocrm php clear_cache.php

# Stato dei container
status:
	docker compose ps

# Stop e rimuovi volumi (ATTENZIONE: cancella tutti i dati)
clean:
	docker compose down --volumes

# ============================================
# Production Deploy (Ansible)
# ============================================

# Deploy completo in produzione
deploy:
	cd production && ansible-playbook -i inventory/hosts.yml deploy.yml

# Solo sync customizzazioni in produzione
sync:
	cd production && ansible-playbook -i inventory/hosts.yml sync.yml
