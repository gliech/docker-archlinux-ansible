# Archlinux Ansible Test Image

[![Github Action Workflow Status](https://github.com/gliech/docker-archlinux-ansible/workflows/test/badge.svg)](https://github.com/gliech/docker-archlinux-ansible/actions?query=branch%3Amaster+workflow%3Atest)
[![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/gliech/docker-archlinux-ansible?label=autobuild&logo=docker&logoColor=white)](https://hub.docker.com/r/gliech/docker-archlinux-ansible/builds)

Archlinux Docker container for Ansible playbook and role testing. Adapted from
[Jeff Geerlings][1] fabulous [container images for ansible testing][2].

## How to Build

This image is built on Docker Hub automatically any time the upstream OS
container is rebuilt, and any time a new release is created in this repository.
But if you need to build the image on your own locally, do the following:

  1. [Install Docker][3].
  2. `cd` into this directory.
  3. Run `docker build -t archlinux-ansible .`

## How to Use

  1. [Install Docker][3].
  2. Pull this image from Docker Hub: `docker pull
     gliech/docker-archlinux-ansible:latest` (or use the image you built
     earlier, e.g. `archlinux-ansible:latest`).
  3. Run a container from the image: `docker run --detach --privileged
     --volume=/sys/fs/cgroup:/sys/fs/cgroup:ro
     gliech/docker-archlinux-ansible:latest` (to test Ansible roles, you can
     add in a volume mounted from the current working directory with
     ``--volume=`pwd`:/etc/ansible/roles/role_under_test:ro``).
  4. Use Ansible inside the container:
     1. `docker exec --tty [container_id] env TERM=xterm ansible --version`
     2. `docker exec --tty [container_id] env TERM=xterm ansible-playbook
        /path/to/ansible/playbook.yml --syntax-check`

> **Important Note**: The image is meant to be used for testing in an isolated
> environment **not for production**. The settings and configuration used may
> not be suitable for a secure and performant production environment. Use on
> production servers/in the wild at your own risk!

## Authors

[Original images][2] and documentation by [Jeff Geerling][1], author of
[Ansible for DevOps][4]. Adapted for Archlinux by Gregor Bückendorf.

[1]: https://www.jeffgeerling.com/
[2]: https://ansible.jeffgeerling.com/#container-images-for-ansible-testing
[3]: https://docs.docker.com/engine/installation/
[4]: https://www.ansiblefordevops.com/
