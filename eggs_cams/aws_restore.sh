psql -h 127.0.0.1 -p 5479 -U postgres -c "CREATE DATABASE mercantile;"
psql -f ../eggs/mydb_backup.dump -h 127.0.0.1 -p 5479 -U postgres -d mercantile