# Archlinux Ansible Test Image

[![semantic release](https://github.com/gliech/docker-archlinux-ansible/actions/workflows/release.yml/badge.svg?branch=master&event=push)][1]
[![weekly build](https://github.com/gliech/docker-archlinux-ansible/actions/workflows/weekly.yml/badge.svg?branch=master)][2]

Archlinux Docker container for Ansible playbook and role testing. Adapted from
[Jeff Geerlings][3] fabulous [container images for ansible testing][4].

## How to Build

The image is built once a week in [this GitHub actions workflow][2] to keep the
repository on [Docker Hub][5] up to date with arch linux's rolling release.
But if you need to build the image on your own locally, do the following:

  1. [Install Docker][6].
  2. `cd` into this directory.
  3. Run `docker build -t archlinux-ansible .`

## How to Use

  1. [Install Docker][6].
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

[Original images][4] and documentation by [Jeff Geerling][3], author of
[Ansible for DevOps][7]. Adapted for Archlinux by Gregor Bückendorf.

[1]: https://github.com/gliech/docker-archlinux-ansible/actions/workflows/release.yml
[2]: https://github.com/gliech/docker-archlinux-ansible/actions/workflows/weekly.yml
[3]: https://www.jeffgeerling.com/
[4]: https://ansible.jeffgeerling.com/#container-images-for-ansible-testing
[5]: https://hub.docker.com/r/gliech/docker-archlinux-ansible
[6]: https://docs.docker.com/engine/installation/
[7]: https://www.ansiblefordevops.com/
