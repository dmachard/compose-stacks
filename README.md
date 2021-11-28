# Stacks

A collection of docker compose for docker swarm

- [dnsdist-dnscollector](./dnsdist-dnscollector)
- [freshrss](./freshrss)
- [traefik](./traefik)


# Traefik

```bash
docker network create --driver=overlay traefik-public
mkdir /mnt/docker-data/certificates/
sudo docker stack deploy -c ./traefik/docker-compose.yml --env-file ./traefik/.env rp
```

The dashboard is available at http://traefik.<your_domain>.

# Freshrss

```bash
mkdir /mnt/docker-data/freshrss-data
mkdir /mnt/docker-data/freshrss-extensions
sudo docker stack deploy -c ./freshrss/docker-compose.yml rss
```

Freshrss is available at http://freshrss.<your_domain>.


# Local DNS

```bash
mkdir /mnt/docker-data/dnstap
sudo docker stack deploy -c ./dnsdist-dnscollector/docker-compose.yml dns
```