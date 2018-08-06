#!/bin/bash
cont_count=$1
echo "creating $cont_count containers.."
sleep 2;
for i in `seq $cont_count`
do
	echo "================================="
	echo "creating www.gamutkart$i container..."
	sleep 1
	docker run --name www.gamutkart$i -d -it --rm jaisriram111/shankar  /bin/bash
	echo "www.gamutkart$i container has been created!"
	echo "================================="
done
docker inspect -f '{{.NetworkSettings.Networks.bridge.IPAddress}}' `docker ps -q` > ip.txt

