#!/bin/bash

echo "=========== WELCOME IN THE BIBBOX XNAT APP ==========="

#adapt the password to access the postgres DB
sed -i "s#changethispasswordinproductionenvironments#${DB_PASSWORD}#g" /data/xnat/home/config/xnat-conf.properties
echo "  postgres password was patched in /data/xnat/home/config/xnat-conf.properties"
echo "======================================================"

#start the tomact sever
$CATALINA_HOME/bin/startup.sh "run"

#put the logs to the output
tail -f $CATALINA_HOME/logs/catalina.out
