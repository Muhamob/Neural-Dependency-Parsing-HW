FROM tensorflow/tensorflow:1.13.2-py3

WORKDIR /home

RUN apt-get update
RUN apt install -y git
RUN git clone https://github.com/nikitakit/self-attentive-parser.git
# COPY kitaev-parser ./

WORKDIR ./self-attentive-parser
COPY requirements.txt ./
RUN pip install -r requirements.txt
RUN pip install benepar[cpu]

WORKDIR ../
RUN mkdir data
ADD data/ data/
RUN ls -la data/

RUN pip install jupyter
COPY run_jupyter.sh ./
RUN mkdir models
VOLUME ./models
EXPOSE 8888

# Download data for benepar
RUN python -c "import benepar; benepar.download('benepar_en2')"

# Download punkt
RUN python -m nltk.downloader 'punkt'

# Install pytorch
RUN apt install -y wget
RUN wget https://download.pytorch.org/whl/cpu/torch-1.1.0-cp36-cp36m-linux_x86_64.whl
RUN pip install torch-1.1.0-cp36-cp36m-linux_x86_64.whl

RUN export SHELL=/bin/bash
WORKDIR self-attentive-parser/
COPY run_test_kitaev.sh ./

WORKDIR EVALB/
RUN make

WORKDIR ../
