#!/bin/bash

PSQL="psql --username=nslee333 --dbname=salon -t -c"

echo $($PSQL "TRUNCATE customers RESTART IDENTITY CASCADE")

echo -e "\n~~ Welcome to my salon ~~\n"

while true
do
    SERVICES_QUERY=$($PSQL "SELECT service_id, name FROM services;")

    echo "Here's our services:"

    echo "$SERVICES_QUERY" | while read SERVICE_ID BAR NAME
    do
        echo "$SERVICE_ID) $NAME"
    done
    
    echo -e "\nPlease enter the id of the service you need."
    read SERVICE_ID_SELECTED
    SERVICE_QUERY=$($PSQL "SELECT service_id FROM services WHERE service_id = $SERVICE_ID_SELECTED")

    if [[ -z $SERVICE_QUERY ]]
    then
        echo "We don't have that option, please try again"
        continue
    else
        break
    fi
done

echo -e "\nPlease enter your phone number:"
read CUSTOMER_PHONE

CUSTOMER_QUERY_RESULT=$($PSQL "SELECT * FROM customers WHERE phone = '$CUSTOMER_PHONE'")

if [[ -z $CUSTOMER_QUERY_RESULT ]]
then
    echo "I don't have you in our system, please enter your name and we'll set up an account for you."
    read CUSTOMER_NAME
    INSERT_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
fi

echo -e "\nPlease enter an appointment time:"
read SERVICE_TIME

CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")

INSERT_CUSTOMER=$($PSQL"INSERT INTO appointments(customer_id, service_id, time) VALUES('$CUSTOMER_ID', '$SERVICE_ID_SELECTED', '$SERVICE_TIME')")

SERVICE_NAME=$($PSQL "SELECT services.name FROM appointments LEFT JOIN customers USING(customer_id) LEFT JOIN services USING(service_id)")

CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")

echo -e "I have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME." | sed 's/  / /g'