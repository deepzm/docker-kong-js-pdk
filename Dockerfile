FROM kong:2.7.1-ubuntu

# Install the js-pluginserver
USER root

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends tzdata
RUN apt-get --assume-yes install nodejs npm python3 make g++
RUN npm install --unsafe -g kong-pdk@0.3.0


ENV term xterm
RUN apt-get --assume-yes install vim nano

COPY ./plugins /usr/local/kong/js-plugins
WORKDIR  /usr/local/kong/js-plugins
RUN npm install

WORKDIR /

