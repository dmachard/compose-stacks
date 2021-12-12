# Stacks

A collection of docker compose for docker swarm

- [dnsdist-dnscollector](./dnsdist-dnscollector)
- [freshrss](./freshrss)
- [traefik](./traefik)
- [prometheus-grafana](./prometheus-grafana)
- [portainer-agent](./portainer-agent)
- [influxdb-ghronograf](./influxdb-ghronograf)

# Portainer

```bash
cd portainer-agent/
sudo docker stack deploy -c docker-compose.yml swarmviz
```

# Traefik

```bash
docker network create --driver=overlay traefik-public
mkdir /mnt/docker-data/certificates/
cd traefik/
sudo docker stack deploy -c docker-compose.yml --env-file .env rp
```

The dashboard is available at http://traefik.<your_domain>.

# Freshrss

```bash
mkdir /mnt/docker-data/freshrss-data
mkdir /mnt/docker-data/freshrss-extensions
cd freshrss/
sudo docker stack deploy -c docker-compose.yml --env-file .env  rss
```

Freshrss is available at http://freshrss.<your_domain>.


# Local DNS

Create the overlay network 

```bash
docker network create --driver=overlay monitoring
```

```bash
mkdir /mnt/docker-data/dnstap
cd dnsdist-dnscollector/
sudo docker stack deploy -c docker-compose.yml --env-file .env dns
```

# Prometheus and Grafana

Create the overlay network 

```bash
docker network create --driver=overlay monitoring
```

```bash
mkdir /mnt/docker-data/grafana-data
mkdir /mnt/docker-data/prometheus-data
cd prometheus-grafana/
sudo docker stack deploy -c docker-compose.yml --env-file .env monitoring
```

Grafana is available at http://<swarmip>:3000
Prometheus is available at http://<swarmip>:9090
AlertManager is available at http://<swarmip>:9093
Blackbox Exporter is available at http://<swarmip>:9115


# InfluxDB and Ghronograf

Create the overlay network 

```bash
docker network create --driver=overlay monitoring
```

```bash
mkdir /mnt/docker-data/influxdb-storage
mkdir /mnt/docker-data/ghronograf-storage
cd influxdb-ghronograf/
sudo docker stack deploy -c docker-compose.yml --env-file .env influxdb
```

Ghronograf is available at http://<swarmip>:8888
InfluxDB is available at http://<swarmip>:8086