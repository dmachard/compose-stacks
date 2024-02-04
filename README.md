# Stacks

A collection of docker compose for docker swarm

- [powerdns-recursor](./powerdns-recursor)
- [unbound](./unbound)
- [syslog-ng](./syslog-ng)
- [dnsdist-dnscollector](./dnsdist-dnscollector)
- [freshrss](./freshrss)
- [traefik](./traefik)
- [prometheus-grafana](./prometheus-grafana)
- [portainer-agent](./portainer-agent)
- [influxdb-ghronograf](./influxdb-ghronograf)

## Syslog-ng

Create folder

```bash
mkdir ./log
```

## Portainer

Start the stack

```bash
cd portainer-agent/
sudo docker stack deploy -c docker-compose.yml swarmviz
```

## Traefik

Create the overlay network

```bash
docker network create --driver=overlay traefik-public
```

Create storage folders

```bash
mkdir /mnt/docker-data/certificates/
```

Start the stack

```bash
cd traefik/
sudo docker stack deploy -c docker-compose.yml --env-file .env rp
```

The dashboard is available at http://traefik.<your_domain>.

## Freshrss

Create storage folders

```bash
mkdir /mnt/docker-data/freshrss-data
mkdir /mnt/docker-data/freshrss-extensions
```

Start the stack

```bash
cd freshrss/
sudo docker stack deploy -c docker-compose.yml --env-file .env  rss
```

Freshrss is available at http://freshrss.<your_domain>.

## Local DNS

Create the overlay network

```bash
docker network create --driver=overlay monitoring
```

Create storage folders

```bash
mkdir /mnt/docker-data/dnstap-storage
mkdir /mnt/docker-data/pdns-storage
mkdir /mnt/docker-data/pdns-storage/run
mkdir /mnt/docker-data/pdns-storage/db
```

Start the stack

```bash
cd dnsdist-dnscollector/
sudo docker stack deploy -c docker-compose.yml --env-file .env dns
```

## Prometheus and Grafana

Create the overlay network

```bash
docker network create --driver=overlay monitoring
```

Create storage folders

```bash
mkdir /mnt/docker-data/grafana-data
mkdir /mnt/docker-data/prometheus-data
mkdir /mnt/docker-data/loki-storage
```

Start the stack

```bash
cd prometheus-grafana/
sudo docker stack deploy -c docker-compose.yml --env-file .env monitoring
```

Grafana is available at http://<swarmip>:3000
Prometheus is available at http://<swarmip>:9090
AlertManager is available at http://<swarmip>:9093
Blackbox Exporter is available at http://<swarmip>:9115

## InfluxDB and Ghronograf

Create the overlay network

```bash
docker network create --driver=overlay monitoring
```

Create storage folders

```bash
mkdir /mnt/docker-data/influxdb-storage
mkdir /mnt/docker-data/ghronograf-storage
```

Start the stack

```bash
cd influxdb-ghronograf/
sudo docker stack deploy -c docker-compose.yml --env-file .env influxdb
```

Ghronograf is available at http://<swarmip>:8888
InfluxDB is available at http://<swarmip>:8086