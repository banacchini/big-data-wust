FROM ubuntu:24.04
RUN apt-get update && apt-get install -y openssh-server && mkdir /run/sshd
COPY lab-ssh/lab_key.pub /tmp/key.pub
RUN for u in bob alice; do \
      useradd -m -s /bin/bash $u && \
      install -d -m 700 -o $u -g $u /home/$u/.ssh && \
      install -m 600 -o $u -g $u /tmp/key.pub /home/$u/.ssh/authorized_keys; \
    done
CMD ["/usr/sbin/sshd", "-D"]