FROM debian:testing

RUN dpkg --add-architecture i386 # If running a 64bit OS
RUN apt-get update
RUN apt-get install -y \
      lib32gcc1 \
      lib32stdc++6 \
      libgcc1 \
      libcurl4-gnutls-dev:i386 \
      wget \
      python \
      python-pip \
      && apt-get clean

RUN pip install crudini

RUN useradd -ms /bin/bash dst

USER dst
WORKDIR /home/dst

RUN wget https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz
RUN tar -xvzf steamcmd_linux.tar.gz && rm steamcmd_linux.tar.gz
RUN mkdir server_dst

# Install Dont Starve Together
RUN ./steamcmd.sh +login anonymous +force_install_dir /home/dst/server_dst +app_update 343050 validate +quit

RUN mkdir -p .klei/DoNotStarveTogether/MyDediServer
RUN echo "Copying executables"
COPY server_dst/bin/* server_dst/bin/

ARG CLUSTER_TOKEN
RUN echo ${CLUSTER_TOKEN:-putyourtokenhere} > .klei/DoNotStarveTogether/MyDediServer/cluster_token.txt
COPY config/cluster.ini .klei/DoNotStarveTogether/MyDediServer/

CMD ["/bin/bash"]
