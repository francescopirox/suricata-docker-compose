#!/bin/sh

# Update suricata rules
#suricata-update

# Start cron
#crond

# Add cronjob
#crontab /etc/crontabs/suricata-update-cron
ip addr del 10.0.0.3/24 dev eth1
ip addr add 10.0.0.1/24 dev eth1
iptables -I FORWARD -j NFQUEUE
#iptables -t nat -A POSTROUTING -o eth0 --source 10.0.0.0/8  -j MASQUERADE
iptables -t nat -A POSTROUTING -o eth1 --source 10.0.0.0/8  -j MASQUERADE
iptables -t nat -A PREROUTING -p tcp -d 192.168.123.123 --dport 8080 -j DNAT --to-destination 10.0.0.2:8000
# Started suricata
/usr/bin/suricata -c /etc/suricata/suricata.yaml -q 0

