# Stacks

A collection of docker compose for docker swarm

- [dnsdist-dnscollector](./dnsdist-dnscollector)
- [freshrss](./freshrss)
- [traefik](./traefik)
- [prometheus-grafana](./prometheus-grafana)
- [portainer-agent](./portainer-agent)

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

```bash
mkdir /mnt/docker-data/dnstap
cd dnsdist-dnscollector/
sudo docker stack deploy -c ./docker-compose.yml --env-file .env dns
```

# Prometheus and Grafana

```bash
mkdir /mnt/docker-data/grafana-data
mkdir /mnt/docker-data/prometheus-data
cd prometheus-grafana/
sudo docker stack deploy -c docker-compose.yml --env-file .env monitoring
```