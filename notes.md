## Commands go along

### Prepare & DUMP
- Login : docker exec -it ptfe_postgres_disk /bin/bash
- Dump DB : pg_dump -U hashicorp  > full_dump.sql

- Finding out container ID 

root@ip-10-0-1-115:~# docker ps | grep postgres
d4370e4a6c12        10.0.1.115:9874/hashicorp-ptfe-postgres:7848c9d                       "docker-entrypoint.s…"   15 minutes ago      Up 15 minutes       0.0.0.0:5432->5432/tcp                                                                                ptfe_postgres_disk
eb5a17b42d44        registry.replicated.com/library/retraced-postgres:10.12-20200520      "docker-entrypoint.s…"   20 minutes ago      Up 20 minutes       5432/tcp                                                                                              retraced-postgres
- Copy file 
root@ip-10-0-1-115:~# docker cp d4370e4a6c12:/full_dump.sql .
root@ip-10-0-1-115:~# ls -la
total 312
drwx------  4 root root   4096 Jul  3 10:42 .
drwxr-xr-x 24 root root   4096 Jul  3 10:16 ..
-rw-------  1 root root     64 Jul  3 10:25 .bash_history
-rw-r--r--  1 root root   3106 Apr  9  2018 .bashrc
-rw-r--r--  1 root root    148 Aug 17  2015 .profile
drwx------  2 root root   4096 Jul  3 10:15 .ssh
-rw-r--r--  1 root root 286943 Jul  3 10:38 full_dump.sql
drwxr-xr-x  3 root root   4096 Jul  3 10:16 snap

- PostgresSQL version check (we need 9.5.X to 9.6.X )
root@d4370e4a6c12:/# psql --version
psql (PostgreSQL) 9.5.22

### Remove TFE 

- `replicatedctl app stop`
- Wait for it to stop `watch replicatedctl app status`
- 

```
service replicated stop
service replicated-ui stop
service replicated-operator stop
```

- Clean Replicated containers : 

```
docker rm -f replicated replicated-ui replicated-operator replicated-premkit replicated-statsd retraced-api retraced-processor retraced-cron retraced-nsqd retraced-postgres
```

- Clean volumes : 

```
docker system prune --all --volumes
```

- Remove leftovers : 

```
rm -rf /etc/default/replicated* /etc/init.d/replicated* /etc/init/replicated* /etc/replicated* /etc/sysconfig/replicated* /etc/systemd/system/multi-user.target.wants/replicated* /etc/systemd/system/replicated* /run/replicated* /usr/local/bin/replicated* /var/lib/replicated* /var/log/upstart/replicated*
```
