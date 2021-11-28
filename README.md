# Stacks

A collection of docker compose

- [dnsdist-dnscollector](./dnsdist-dnscollector): stack docker compose for dnsdist and go-dnscollector
- [freshrss](./freshrss): freshrss stack  docker compose

# Run-it

```bash
sudo docker stack deploy -c ./dnsdist-dnscollector/docker-compose.yml dns
sudo docker stack deploy -c ./freshrss/docker-compose.yml rss
```