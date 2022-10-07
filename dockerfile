FROM python:3.8-slim-buster

ARG PROJECT_PATH

ENV PYTHONUNBUFFERED=1
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8
ENV PYTHONPATH /root

RUN apt-get update \
    && apt-get install \
        curl \
        git -y
RUN curl -sL https://ctl.flyte.org/install | bash -s -- -b /usr/local/bin

COPY $PROJECT_PATH /root

RUN cd /root && pip install --upgrade .

WORKDIR /root