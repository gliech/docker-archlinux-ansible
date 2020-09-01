FROM archlinux:latest
LABEL maintainer="Gregor Bückendorf"
ENV container=docker

ENV pip_packages="ansible"

# Install requirements.
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

# Install Ansible via Pip.
RUN pip install $pip_packages

# Install Ansible inventory file.
RUN mkdir -p /etc/ansible
RUN echo -e '[local]\nlocalhost ansible_connection=local' > /etc/ansible/hosts

VOLUME ["/sys/fs/cgroup"]
CMD ["/usr/lib/systemd/systemd"]
