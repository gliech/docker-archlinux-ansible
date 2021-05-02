FROM archlinux:latest as build
LABEL maintainer="Gregor Bückendorf"
ENV container=docker

# Install requirements
RUN pacman \
      --sync \
      --refresh \
      --sysupgrade \
      --noconfirm \
      --noprogressbar \
      --needed \
      python \
      python-pip \
      sudo \
      which \
      inetutils \
 && (yes | head --lines=2; yes n) | \
    pacman \
      --sync \
      --clean \
      --clean \
 && rm -rf /var/lib/pacman/sync/*

# Install Ansible via Pip
RUN pip install ansible

# Install Ansible inventory file
RUN mkdir -p /etc/ansible
COPY hosts /etc/ansible/

VOLUME ["/sys/fs/cgroup"]
CMD ["/usr/lib/systemd/systemd"]

FROM build as test
COPY test .
RUN ansible-playbook site.yml
