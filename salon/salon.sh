#!/bin/bash

PSQL="psql --username=nslee333 --dbname=salon -t --no-align -c"

# echo $($PSQL "TRUNCATE customers RESTART IDENTITY CASCADE")

echo -e "\n~~ Welcome to my salon ~~\n"

echo "Here's our services:"

# Need to swap out hard coded services echo for a loop that checks for services. ------

# ID=$($PSQL "SELECT service_id, name FROM services")


# Come back to this

# echo "$ID" | while read -r FIRST BAR SECOND
# do
#     echo "$FIRST) $SECOND"
# done

PROMPT="1) Cut\n2) Trim\n3) Color\n4) Shave\n5) Highlights"

echo -e $PROMPT

echo -e "\nPlease enter the service:"
read -r SERVICE_ID_SELECTED 

SERVICE_QUERY=$($PSQL "SELECT * FROM services WHERE service_id = '$SERVICE_ID_SELECTED'")

if [[ $SERVICE_ID_SELECTED != $SERVICE_QUERY ]]
then
    echo -e "Please try again.\n$PROMPT"
fi

echo -e "\nPlease enter your phone number:"
read CUSTOMER_PHONE 

echo -e "\nPlease enter an appointment time:"
read SERVICE_TIME



CUSTOMER_QUERY_RESULT=$($PSQL "SELECT * FROM customers WHERE phone = '$CUSTOMER_PHONE'")

if [[ -z $CUSTOMER_QUERY_RESULT ]]
then
    echo "I don't have you in our system, please enter your name and we'll set up an account for you."
    read INSERT_NAME

    $PSQL "INSERT INTO customers(name, phone) VALUES('$INSERT_NAME', '$CUSTOMER_PHONE')"
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
else
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
fi

CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")

if [[ $CUSTOMER_ID ]]
then
    INSERT_CUSTOMER=$($PSQL"INSERT INTO appointments(customer_id, service_id, time) VALUES('$CUSTOMER_ID', '$SERVICE_ID_SELECTED', '$SERVICE_TIME')")
    if [[  ]]
fi



SERVICE_NAME=$($PSQL "SELECT services.name FROM appointments LEFT JOIN customers USING(customer_id) LEFT JOIN services USING(service_id);")

echo "I have put you down for $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME"

# 3 444-4444 Nathan 10:30

# Ended at testing for all edge cases.

# Need to think through this.
