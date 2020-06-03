# Distributed.net Docker Client

This image is designed to be managed by a Kubernetes or Docker Swarm cluster.

It will start up and crunch through one work unit and then shutdown, Kubernetes or Docker Swarm will then handle restarting another container to take its place and process another work unit.

## Building

docker build --build-arg arch=amd64 -t recklessop/dnetc-client:latest .

You need to include a processor architecture argument so that the build process pulls the proper dnetc client.

Available options include:
amd64
arm64
armel
