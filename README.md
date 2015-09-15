# Dnsmasq
[Docker][docker] image providing [dnsmasq][dnsmasq] service that reacts to your complex docker environments changes. In a complex docker environment managed with [docker-compose][docker-compose], or similar, the communication between continers is ensured by linking the containers; with dnsmasq the communication can be ensured by using the DNS service it provides allowing you to run specific components, without the hard dependencies of the links. The container reacts and updates the dnsmasq service whenever containers are added or removed from the environment. All in under 6 MB of disk space.

# Usage
Dnsmasq requires running the Docker container with NET_ADMIN capability otherwise it will silently fail.
```
docker run --cap-add=NET_ADMIN aciobanu/dnsmasq
```

Alternatively dnsmasq can be run in debug mode
```
docker run aciobanu/dnsmasq -d
```

By default, the container starts dnsmasq with

    `-k` - Do NOT fork into the background, do NOT run in debug mode
    `-q` - Log DNS queries

To overwrite the default behavior, just pass the container with the desired dnsmasq parameters, for example
```
docker run --cap-add=NET_ADMIN aciobanu/dnsmasq --keep-in-foreground --dns-loop-detect --no-negcache
```

For a full list of dnsmasq goodies, see the dnsmasq help
```
docker run aciobanu/dnsmasq --help
```

[dnsmasq]: http://www.thekelleys.org.uk/dnsmasq/doc.html
[docker]: https://www.docker.com
[docker-compose]: https://docs.docker.com/compose/
