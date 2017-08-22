#!/usr/bin/python
# -*- coding: iso-8859-15 -*-

class DockerImages:

    images = [
        "cassandra",
        "harisekhon/hbase",
        "jenkins",
        "kong",
        "mongo",
        "rabbitmq",
        "rancher/server",
        "redis",
        "sonatype/nexus",
        "wurstmeister/kafka",
        "xemuliam/nifi"
    ]

    def __init__(self):
        self.command_images = "docker images"

    def get_images(self):
        return self.images

    def get_command_images(self):
        return self.command_images