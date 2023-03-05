FROM python:3.9-slim-buster

WORKDIR /

RUN apt update && apt install -y \
    build-essential \
    libtool \
    autoconf \
    unzip \
    wget \
    libssl-dev \
    gfortran \
    pkg-config \
    libopenblas-dev 
RUN mkdir ~/temp && cd ~/temp \
    && wget https://cmake.org/files/v3.25/cmake-3.25.0.tar.gz \
    && tar -zxf cmake-3.25.0.tar.gz \
    && cd cmake-3.25.0 \
    && ./bootstrap \
    && make \
    && make install
RUN cd ~ && rm -rf temp/
RUN pip install numpy
RUN pip install pandas
RUN pip install scipy
RUN apt update && apt install -y curl
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | bash -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"
RUN pip install river
RUN pip install grpcio