# EspoCRM Development Environment

Ambiente Docker per lo sviluppo di customizzazioni EspoCRM.

## Requisiti

- Docker
- Docker Compose

## Quick Start

```bash
# Avvia l'ambiente
docker compose up -d

# Accedi a EspoCRM
# http://localhost:8080
# User: admin / Password: admin123
```

## Struttura Customizzazioni

```
custom/
└── Espo/
    ├── Modules/     # Nuovi moduli custom
    └── Custom/      # Estensioni entità esistenti

client/
└── custom/          # Customizzazioni frontend/temi
```

## Comandi Utili

```bash
# Rebuild cache (dopo modifiche PHP)
docker compose exec espocrm php rebuild.php

# Clear cache
docker compose exec espocrm php clear_cache.php

# Shell nel container
docker compose exec espocrm bash

# Log
docker compose logs -f espocrm

# Stop
docker compose down

# Stop e rimuovi volumi (ATTENZIONE: cancella dati)
docker compose down --volumes
```

## Configurazione

Modifica `.env` per personalizzare:

| Variabile | Default | Descrizione |
|-----------|---------|-------------|
| `DB_ROOT_PASSWORD` | espocrm_root_secret | Password root MariaDB |
| `DB_NAME` | espocrm | Nome database |
| `DB_USER` | espocrm | Utente database |
| `DB_PASSWORD` | espocrm_secret | Password database |
| `ESPOCRM_ADMIN_USERNAME` | admin | Username admin |
| `ESPOCRM_ADMIN_PASSWORD` | admin123 | Password admin |
| `ESPOCRM_SITE_URL` | http://localhost:8080 | URL sito |
| `ESPOCRM_LANGUAGE` | it_IT | Lingua |
| `ESPOCRM_TIME_ZONE` | Europe/Rome | Timezone |

## Documentazione EspoCRM

- [Customization](https://docs.espocrm.com/development/)
- [Creating Custom Module](https://docs.espocrm.com/development/module/)
- [Docker Installation](https://docs.espocrm.com/administration/docker/installation/)
