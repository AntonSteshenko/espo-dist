# EspoCRM Production Deploy

Deploy automatizzato con Ansible e Traefik.

## Requisiti

- Ansible >= 2.14
- Python 3.x

## Setup

1. Installa le collezioni Ansible:
```bash
ansible-galaxy collection install -r requirements.yml
```

2. Configura `inventory/hosts.yml` con i dati del server:
```yaml
all:
  hosts:
    production:
      ansible_host: "tuo-server-ip"
      ansible_user: "root"
```

3. Configura `group_vars/all.yml`:
```yaml
domain: crm.tuodominio.com
letsencrypt_email: admin@tuodominio.com
db_root_password: "password-sicura"
db_password: "password-sicura"
espocrm_admin_password: "password-sicura"
```

## Comandi

```bash
# Deploy completo (dalla root del progetto)
make deploy

# Solo sync customizzazioni
make sync
```

## Struttura

```
production/
├── inventory/hosts.yml      # Server di produzione
├── group_vars/all.yml       # Variabili configurazione
├── roles/
│   ├── docker/              # Installa Docker
│   ├── traefik/             # Setup Traefik + Let's Encrypt
│   ├── espocrm/             # Deploy EspoCRM
│   ├── customizations/      # Sync custom/ e client/custom/
│   └── backup/              # Backup giornaliero DB
├── deploy.yml               # Playbook completo
└── sync.yml                 # Solo customizzazioni
```

## Backup

I backup vengono salvati in `/opt/espocrm/backups/` sul server.
- Eseguiti alle 3:00 ogni giorno
- Retention: 7 giorni (configurabile in `group_vars/all.yml`)
