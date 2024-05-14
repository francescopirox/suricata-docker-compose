# prepare environment
prepare:
	-sudo ./net.sh add
	
clean:
	-sudo ./net.sh del

up:	prepare
	sudo docker network prune -f
	sudo docker compose up -d
	-sudo ip route add 10.0.0.0/8 via 192.168.123.123

stop:
	sudo docker compose stop

down:
	-sudo ip route del 10.0.0.0/8 via 192.168.123.123
	sudo docker compose down

logs:
	sudo docker compose logs -f
