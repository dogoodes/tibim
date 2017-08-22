#!/usr/bin/python
# -*- coding: iso-8859-15 -*-

from subprocess import call

class DockerSudo:

    def __init__(self):
        self.command_sudo = ["echo", "sudo", "-S", "docker", "-v"]

    def get_docker_sudo(self):
        return call(self.command_sudo)