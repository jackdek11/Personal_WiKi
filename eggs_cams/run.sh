python3 manage.py migrate
python3 manage.py ensure_adminuser --username=testadmin --email=camstestadmin@aogroup.co.za --password=5S@^a3r*v
python3 manage.py loaddata fixtures/*
python3 manage.py loaddata fixtures_testing/*
python3 manage.py runserver 0.0.0.0:8001