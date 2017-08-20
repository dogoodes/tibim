#!/usr/bin/python
from subprocess import call

commandDocker = "pull"
images = [
            "xemuliam/nifi",
            "rabbitmq",
            "wurstmeister/kafka",
            "mongo",
            "harisekhon/hbase",
            "redis",
            "rancher/server",
            "kong",
            "cassandra",
            "sonatype/nexus",
            "jenkins"
         ]

for j in images:
    command = ["echo", "sudo", "-S", "docker", commandDocker, j]
    proc = call(command)
    print proc