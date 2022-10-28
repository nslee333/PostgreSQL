#!/bin/bash

PSQL="psql --username=nslee333 --dbname=salon -t --no-align -c"

echo "Prompt:"
read SERVICE_ID_SELECTED

SERVICE_QUERY=$($PSQL "SELECT * FROM services WHERE service_id = '$SERVICE_ID_SELECTED'")

if [[ $SERVICE_ID_SELECTED != $SERVICE_QUERY ]]
then
    echo "Success"
fi 