FROM python:3.7.5-buster

WORKDIR /home

RUN apt-get update
RUN apt install -y git
RUN git clone https://github.com/Muhamob/biaffine-parser.git

RUN mkdir models
VOLUME ./models

RUN export SHELL=/bin/bash
WORKDIR biaffine-parser/

RUN apt install -y wget
RUN wget https://download.pytorch.org/whl/cpu/torch-1.3.1%2Bcpu-cp37-cp37m-linux_x86_64.whl
RUN pip install torch-1.3.1+cpu-cp37-cp37m-linux_x86_64.whl
RUN pip install transformers==2.1.1

COPY run_dozat_test.sh ./
