cd ../../quickstart/
docker-compose down --re
sleep 5
docker volume prune
sleep 5
docker-compose -f docker-compose.yml up -d
cd ../src/cams