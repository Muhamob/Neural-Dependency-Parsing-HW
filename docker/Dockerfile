FROM tensorflow/tensorflow:1.13.2-py3

WORKDIR /home

RUN apt-get update
RUN apt install -y git
RUN git clone https://github.com/nikitakit/self-attentive-parser.git

WORKDIR ./self-attentive-parser
COPY requirements.txt ./
RUN pip install -r requirements.txt
RUN pip install benepar[cpu]
