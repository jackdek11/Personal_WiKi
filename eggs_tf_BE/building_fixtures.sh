#!/bin/sh
#
# **************************************************************
# Copyright (c) 2020, Cyber-mint (Pty) Ltd
# See LICENSE in the project root for license information.
# **************************************************************
#

cd ../../quickstart/
docker-compose down --re
sleep 5
docker volume prune
sleep 5
docker-compose up -d postgres redis
cd ../src/teamfu
sleep 5
python3 manage.py migrate
python3 manage.py loaddata fixtures/prod/*
python3 manage.py ensure_adminuser --username=$TEAMFU_ADMIN_USERNAME --email=admin@teamfu.tech --password=$TEAMFU_ADMIN_PASSWORD
python3 manage.py fixture
python3 manage.py dumpdata > fixtures/testing/databasedump_testing.json