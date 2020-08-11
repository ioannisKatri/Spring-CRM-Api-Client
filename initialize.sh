# tells the terminal that we are using bash shell

#cd ./crm-web-app-rest-client/sql-scripts/
#
# building the project

cd ./crm-web-app-rest-client

mvn clean install

cd ..

cd ./spring-crm-rest-security

mvn clean install

cd ..
#
# if the file doesn't exist, try to create folder
if [ ! -e ./.docker/mysql/scripts/02-customer-tracker.sql ]
#
then
  cp ./sql-scripts/02-customer-tracker.sql ./.docker/mysql/scripts/
#
echo --------------------------------SQL script was copied.--------------------------------
#
fi
#
#
echo --------------------------------Project was build.--------------------------------


docker-compose up -d --build

sleep 10



# IMPORTANT ->  Change it for windows Users
# OPEN BROWSER WITH THE url
/usr/bin/open -a "/Applications/Google Chrome.app" 'http://dev.security.com'
