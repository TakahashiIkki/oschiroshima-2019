# oschiroshima-2019

## これは何のレポジトリ？

これは [オープンソースカンファレンス 2019 Hiroshima](https://www.ospn.jp/osc2019-hiroshima/) に使用するデモ環境を構築する為のレポジトリです。

## デモ内容

- DockerによってDBを構築する.
- Dockerの上のDBにデータを復元する。
- EXPLAINでデータをチェックする。
- 遅い箇所をチェックする。
- Indexを貼って高速化する。

## Dodkerを起動させる方法

このレポジトリは 以下を前提に動作確認しています。

```
$ docker -v
Docker version 19.03.1, build 74b1e89

$ docker-compose -v
docker-compose version 1.24.1, build 4667896b
```

## dockerを起動する方法


```
# このレポジトリを git clone する.
$ cd oschiroshima-2019
# docker-compose.yml と同じ環境で動作させる。
$ docker-compose up --build -d
```

### 動作状況を確認する

```
$ docker ps -a
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                    NAMES
d8f060b660b0        2019_postgres       "docker-entrypoint.s…"   2 hours ago         Up 2 hours          0.0.0.0:5434->5432/tcp   osc_pgsql
```

## デフォルトのデータベース

```
$ docker exec -it osc_pgsql bash

root@d8f060b660b0:/# psql -h localhost -U osc_user osc_demo
psql (11.5 (Debian 11.5-1.pgdg90+1))
Type "help" for help.

osc_demo=# \l
                             List of databases
   Name    |  Owner   | Encoding | Collate | Ctype |   Access privileges   
-----------+----------+----------+---------+-------+-----------------------
 osc_demo  | osc_user | UTF8     | C       | C     | 
 postgres  | osc_user | UTF8     | C       | C     | 
 template0 | osc_user | UTF8     | C       | C     | =c/osc_user          +
           |          |          |         |       | osc_user=CTc/osc_user
 template1 | osc_user | UTF8     | C       | C     | =c/osc_user          +
           |          |          |         |       | osc_user=CTc/osc_user
(4 rows)

osc_demo=# \dt
Did not find any relations.
```