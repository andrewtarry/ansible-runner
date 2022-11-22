FROM debian:bullseye

ENV PATH "/root/.local/bin:$PATH"
RUN apt update && apt -y upgrade && apt install -y gnupg curl python3 python3-distutils

RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && /usr/bin/python3 get-pip.py --user
RUN /usr/bin/python3 -m pip install --user ansible

RUN rm get-pip.py

# RUN echo 'deb http://ppa.launchpad.net/ansible/ansible/ubuntu focal main' | tee /etc/apt/sources.list.d/ansible.list && \
#     apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367

# RUN apt update
# RUN apt install -y ansible

# RUN ansible --version