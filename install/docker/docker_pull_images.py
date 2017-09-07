#!/usr/bin/python
# -*- coding: iso-8859-15 -*-

from subprocess import call, check_output
from docker_images import DockerImages
from docker_sudo import DockerSudo

class DockerPullImages:

    def __init__(self):
        DockerSudo().get_docker_sudo()
        self.out = check_output(DockerImages().get_command_images(), shell=True)
        # self.command_pull = "docker", "pull"

    # If the image does not exist, find in the Docker Hub
    def pull_image_not_exists(self):
        images = DockerImages().get_images()
        for j in images:
            if self.out.find(j) == -1:
                command = ["docker", "pull", str(j)]
                call(command)

    #If the image exist, find in the Docker Hub for update
    def pull_image_exists(self):
        images = DockerImages().get_images()
        for j in images:
            if self.out.find(j) != -1:
                command = ["docker", "pull", str(j)]
                call(command)