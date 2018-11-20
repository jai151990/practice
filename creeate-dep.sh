#!/bin/bash
cont_count=$1
echo "creating $cont_count containers.."
sleep 2;
for i in `seq $cont_count`
do
	echo "================================="
	echo "creating www.gamutkart$i container..."
	sleep 1
	docker run --name ford$i -d -it --rm jaisriram111/shankar  /bin/bash
	echo "www.gamutkart$i container has been created!"
	echo "================================="
done
docker inspect -f '{{.NetworkSettings.Networks.bridge.IPAddress}}' `docker ps -q` > ips.txt

################
echo "server ssh starting"
docker attach ford$i -it /bin/bash
#service ssh start
for j in `cat ip.txt`
    do
      ssh siva@j
      echo "deploye war file into $j "
      sleep 3
    #  sshpass -p "1234" scp target/sbibank.war siva@$i:/home/siva/soft/apache-tomcat-8.5.32/webapps
       sshpass -p "1234" scp target/ola.war siva@$j:/home/siva/soft/apache-tomcat-8.5.32/webapps

      echo "starting tomcat server $j"
      sshpass -p "1234" ssh siva@$j "JAVA_HOME=/home/siva/soft/jdk1.8.0_171" "/home/siva/soft/apache-tomcat-8.5.32/bin/./startup.sh"
    done
echo "deploy success"
