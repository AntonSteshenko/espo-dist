# EspoCRM Template

Template per sviluppo e deploy in produzione di customizzazioni EspoCRM.

## Uso del Template

**Opzione A - Fork (consigliato):**
```bash
# 1. Fork questo repository su GitHub
# 2. Clona il tuo fork
git clone git@github.com:TUO-USERNAME/espo-dist.git mio-progetto
cd mio-progetto
```

**Opzione B - Clone con reinit (repo pulito senza storia):**
```bash
git clone git@github.com:ORIGINAL/espo-dist.git mio-progetto
cd mio-progetto
rm -rf .git
git init
git add .
git commit -m "init"
git remote add origin git@github.com:TUO-USERNAME/mio-progetto.git
git push -u origin main
```

## Requisiti

- Docker
- Docker Compose
- Make

## Quick Start

```bash
# 1. Copia il file di configurazione
cp .env.dev.example .env

# 2. Avvia l'ambiente
make up
```

Accedi a EspoCRM: http://localhost:8080
Credenziali: `admin` / `admin123`

## Comandi Make

| Comando | Descrizione |
|---------|-------------|
| `make up` | Avvia l'ambiente di sviluppo |
| `make down` | Ferma l'ambiente |
| `make restart` | Riavvia i container |
| `make logs` | Mostra i log in tempo reale |
| `make shell` | Apre shell nel container |
| `make rebuild` | Rebuild cache (dopo modifiche PHP) |
| `make clear-cache` | Pulisce la cache |
| `make status` | Stato dei container |
| `make clean` | Stop e rimuovi volumi (cancella dati) |
| `make deploy` | Deploy completo in produzione |
| `make sync` | Sync solo customizzazioni in produzione |

## Struttura Customizzazioni

```
custom/
└── Espo/
    ├── Modules/     # Nuovi moduli custom
    └── Custom/      # Estensioni entità esistenti

client/
└── custom/          # Customizzazioni frontend/temi
```

## Configurazione

Copia il file di esempio per creare la configurazione locale:

```bash
cp .env.dev.example .env
```

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

## Production Deploy

Per il deploy in produzione con Ansible e Traefik, vedi [production/README.md](production/README.md).

## Documentazione EspoCRM

- [Customization](https://docs.espocrm.com/development/)
- [Creating Custom Module](https://docs.espocrm.com/development/module/)
- [Docker Installation](https://docs.espocrm.com/administration/docker/installation/)
