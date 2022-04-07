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
python3 manage.py loaddata fixtures/testing/*
python3 manage.py runserver 0.0.0.0:8001