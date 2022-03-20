#!/bin/bash

sudo apt install -y postgresql postgresql-contrib
sudo -u postgres createdb misery_was
sudo -u postgres psql -c "CREATE USER misery_was_user WITH PASSWORD 'bQcPahYHsfgMDh2gb9JwqypKx58fK2E9';";
sudo -u postgres psql -c "ALTER ROLE misery_was_user SET client_encoding TO 'utf8';";
sudo -u postgres psql -c "ALTER ROLE misery_was_user SET default_transaction_isolation TO 'read committed';";
sudo -u postgres psql -c "ALTER ROLE misery_was_user SET timezone TO 'UTC';";
sudo -u postgres psql -c "ALTER ROLE misery_was_user CREATEDB;"
sudo -u postgres psql -c "GRANT ALL PRIVILEGES ON DATABASE misery_was TO misery_was_user;"
./misery_was_backend/manage.py migrate