# Autopilot Pattern RethinkDB

This image uses ContainerPilot to register Rethinkdb with Consul. As you scale out the number of Rethinkdb instances they will be automatically clustered together.

[![DockerPulls](https://img.shields.io/docker/pulls/autopilotpattern/rethinkdb.svg)](https://registry.hub.docker.com/u/autopilotpattern/rethinkdb/)
[![DockerStars](https://img.shields.io/docker/stars/autopilotpattern/rethinkdb.svg)](https://registry.hub.docker.com/u/autopilotpattern/rethinkdb/)


## Environment Variables

- _CONSUL_ hostname where consul can be found
- _CONSUL_AGENT_ determines if the consul agent is executed in the container


## Example Usage

```
$ cd examples/compose
$ docker-compose up -d
$ docker-compose  scale rethinkdb=3
```

Look at the dashboard for one of the rethinkdb instances and observe that they are all clustered.
