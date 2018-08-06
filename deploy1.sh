#!/bin/bash
ENVIRONMENT=$1
if [ $ENVIRONMENT = "QA" ]; then
  for i in `cat ip.txt`
    do
      echo "deploye war file into $i "
      sleep 3
    #  sshpass -p "1234" scp target/sbibank.war siva@$i:/home/siva/soft/apache-tomcat-8.5.32/webapps
       sshpass -p "1234" scp target/sbibank.war siva@$i:/home/siva/soft/apache-tomcat-8.5.32/webapps

      echo "starting tomcat server $i"
      sshpass -p "1234" ssh siva@$i "JAVA_HOME=/home/siva/soft/jdk1.8.0_171" "/home/siva/soft/apache-tomcat-8.5.32/bin/./startup.sh"
    done
  echo "deploy success"
fi

