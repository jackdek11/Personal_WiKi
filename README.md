# Personal_WiKi
personal Wiki for Jack with useful code

### Nextcloud permission denied fix
```
sudo chown -R $USER:$USER *
```

### Github ssh keys
#### Deploying to Digitial ocean
```shell
git tag $tag                                                # tag build
git push --tags                                             # push locally tagged builds
git tag -d $tag                                             # delete tag
git push origin :refs/tags/$tag                             # update origin with local tag
```

### Pipelines
- Inject os enviroment variable into json file
```shell
$key is from env
jq '.key = "'"$key"'"' j.json > '$TEST_VAR' && mv '$TEST_VAR' j.json 
```

### Github ssh keys

```shell
cd .ssh
ssh-keygen -t rsa -b 4096 -C $email -f id_private
eval "$(ssh-agent -s)"
xclip -sel clip < ~/.ssh/id_private.pub
cat ~/.ssh/id_private.pub
chmod 400 ~/.ssh/id_private
nano ~/.ssh/config
# add the identity
ssh-add id_private
# list known identities
ssh-add -l
```
### Github conf
```shell
git config --global user.name $username
# use a different email address per repo ...
git config --global user.email $email
git config --global color.ui auto
ssh -T git@github.com
```
if you get an error on incorrectly configured, something like "line 1: Bad configuration...",
to resolve;
```shell
cd ~/.ssh
rm -rf config
ssh -T git@github.com
```


### Docker install
```shell
sudo apt-get remove docker docker-engine docker.io containerd runc
sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get install docker-ce docker-ce-cli containerd.io
```
### Add user to sudoers group
```shell
adduser demo_user
sudo usermod -a -G sudo $username
```
### Add docker to sudoers group
```shell
sudo groupadd docker
sudo usermod -a -G docker $USER
sudo systemctl restart docker.service
sudo apt install docker-compose
```
### docker
```shell
docker inspect $container_name
docker run -d -e POSTGRES_PASSWORD=mypassword -e POSTGRES_USER=myuser -p 5442:5442 --name mypostgres postgres:14
docker-compose up --build
docker volume prune
docker exec -it $container

docker image prune
docker image ls -l
```

### Teamfu
```shell
python3 manage.py migrate && python3 manage.py loaddata fixtures/prod/* && python3 manage.py ensure_adminuser --username=$TEAMFU_ADMIN_USERNAME --email=admin@teamfu.tech --password=$TEAMFU_ADMIN_PASSWORD && python3 manage.py runserver 0.0.0.0:8001
python3 manage.py migrate && python3 manage.py loaddata fixtures/testing/* && python3 manage.py runserver 0.0.0.0:8001
docker exec -it postgresql psql -h 127.0.0.1 -U postgres -d teamfu 
ssh vagrant@teamfu.tech
scp vagrant@teamfu.tech:/home/backup/20220201-11\:22\:26-teamfu.db.tar /home/jack/cloud/teamfu/db/.
./restore_db.sh ~/cloud/teamfu/db/20220201-11\:22\:26-teamfu.db.tar 
```

### networks
```shell
sudo netdiscover -r 10.0.0.0/24 -P
netstat -tulpn
arp
sudo tcpdump -s0 -U -n -w - -i enp2s0
ip a s
```


Set iwconfig to monitor mode:
```shell
sudo ip link set dev wlp3s0 down
sudo iwconfig wlp3s0 mode monitor
iwconfig
sudo iwconfig wlp3s0 mode managed sudo ip link set dev wlp3s0 up
```
