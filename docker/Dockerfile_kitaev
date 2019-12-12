FROM pytorch/pytorch

WORKDIR /home

RUN apt-get update
RUN apt install -y git
RUN git clone https://github.com/nikitakit/self-attentive-parser.git

WORKDIR ./self-attentive-parser
COPY requirements.txt ./

WORKDIR ../
RUN mkdir data
ADD data/ data/
RUN ls -la data/

RUN mkdir models
VOLUME ./models

RUN export SHELL=/bin/bash
WORKDIR self-attentive-parser/
COPY run_test_kitaev.sh ./

WORKDIR EVALB/
RUN make

WORKDIR ../

# install venvs
RUN conda create python=3.6 -n kitaev
RUN echo "source activate kitaev" > ~/.bashrc
ENV PATH /opt/conda/envs/kitaev/bin:$PATH

# Install pytorch in kitaev environment
RUN apt install -y wget
RUN wget https://download.pytorch.org/whl/cpu/torch-1.1.0-cp36-cp36m-linux_x86_64.whl
RUN pip install numpy
RUN pip install torch-1.1.0-cp36-cp36m-linux_x86_64.whl
RUN pip install -r requirements.txt

# Download punkt
RUN python -m nltk.downloader 'punkt'
