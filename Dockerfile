FROM debian:bullseye

ARG ansibleversion=2.14.0
ENV PATH "/root/.local/bin:$PATH"
RUN apt update && apt -y upgrade && apt install -y gnupg curl python3 python3-distutils

RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && /usr/bin/python3 get-pip.py --user
RUN /usr/bin/python3 -m pip install --user ansible ansible-core==${ansibleversion}

RUN rm get-pip.py