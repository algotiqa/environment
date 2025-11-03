#!/bin/bash

dbName=datastore
dbUser=tradalia
dbPass=tradalia
dbPort=3410

psql -h localhost -p $dbPort -U postgres << EOF
drop database if exists ${dbName}; 
create user $dbUser password '${dbPass}';
create database ${dbName} owner ${dbUser};
EOF

psql -h localhost -p $dbPort -U $dbUser -d $dbName < $dbName-schema.sql
