FROM python:3.6.9-buster

WORKDIR /home

RUN apt-get update
RUN apt install -y git
RUN git clone https://github.com/nikitakit/self-attentive-parser.git

RUN mkdir models
VOLUME ./models
RUN export SHELL=/bin/bash

WORKDIR self-attentive-parser/
COPY requirements.txt ./
COPY run_kitaev_test.sh ./

WORKDIR EVALB/
RUN make
WORKDIR ../

# Install pytorch in kitaev environment
RUN apt install -y wget
RUN wget https://download.pytorch.org/whl/cpu/torch-1.1.0-cp36-cp36m-linux_x86_64.whl
RUN pip install torch-1.1.0-cp36-cp36m-linux_x86_64.whl
RUN rm torch-1.1.0-cp36-cp36m-linux_x86_64.whl
RUN pip install numpy
RUN pip install -r requirements.txt

