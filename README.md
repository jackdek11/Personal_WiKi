# Personal_WiKi
personal Wiki for Jack with useful code

### docker
```
docker inspect <container_name>
docker run -d -e POSTGRES_PASSWORD=mypassword -e POSTGRES_USER=myuser -p 5442:5442 --name mypostgres postgres:14
docker-compose up --build
docker volume prune
docker exec -it <container>

docker image prune
docker image ls -l
```

### Teamfu
```
docker exec -it postgresql psql -h 127.0.0.1 -U postgres -d teamfu 
ssh vagrant@teamfu.tech
scp vagrant@teamfu.tech:/home/backup/20220201-11\:22\:26-teamfu.db.tar /home/jack/cloud/teamfu/db/.
./restore_db.sh ~/cloud/teamfu/db/20220201-11\:22\:26-teamfu.db.tar 
```

### networks
```
sudo netdiscover -r 10.0.0.0/24 -P
netstat -tulpn
arp
sudo tcpdump -s0 -U -n -w - -i enp2s0
ip a s
```


Set iwconfig to monitor mode:
```
sudo ip link set dev wlp3s0 down
sudo iwconfig wlp3s0 mode monitor
iwconfig
sudo iwconfig wlp3s0 mode managed sudo ip link set dev wlp3s0 up
```
