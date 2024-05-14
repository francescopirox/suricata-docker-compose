FROM ubuntu

RUN apt-get update && apt-get install -y openssh-server iproute2 iptables inetutils-ping vim nano net-tools dnsutils python3 python3-scapy python3-flask traceroute 

COPY entrypoint.sh entrypoint.sh

RUN chmod +x entrypoint.sh

RUN apt-get install -y curl

ENTRYPOINT ["bash","./entrypoint.sh"]


