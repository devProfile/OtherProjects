#!/usr/bin/env bash

mvn clean package

echo 'Copy files...'


scp -i ~/.ssh/id_rsa \
    target/falled-1.0-SNAPSHOT.jar \
    127.0.0.1:/home/jura/

echo 'Restart server...'

ssh -i ~/.ssh/id_rsa 127.0.0.1 << EOF

pgrep java | xargs kill -9
nohup java -jar falled-1.0-SNAPSHOT.jar > log.txt &

EOF

echo 'Bye'
