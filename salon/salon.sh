#!/bin/bash

PSQL="psql --username=nslee333 --dbname=salon -t --no-align -c"

echo $($PSQL "TRUNCATE customers RESTART IDENTITY CASCADE")

echo -e "\n~~ Welcome to my salon ~~\n"

echo "Here's our services:"

# Need to swap out hard coded services echo for a loop that checks for services. ------

# ID=$($PSQL "SELECT service_id, name FROM services")


# Come back to this

# echo "$ID" | while read -r FIRST BAR SECOND
# do
#     echo "$FIRST) $SECOND"
# done


echo -e "1) Cut\n2) Trim\n3) Color\n4) Shave\n5) Highlights"
echo -e "\nPlease enter: \n- Service id\n- Phone number\n- Name\n- Appointment Time"
read -r SERVICE_ID_SELECTED CUSTOMER_PHONE CUSTOMER_NAME SERVICE_TIME

# Need to wait here

if [[ -z $CUSTOMER_PHONE ]]
then
    INSERT_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
fi

if [[ -z $INSERT_RESULT ]]
then
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE name = '$CUSTOMER_NAME'")
fi


if [[ $CUSTOMER_ID ]]
then
    INSERT_CUSTOMER=$($PSQL"INSERT INTO appointments(customer_id, service_id, time) VALUES('$CUSTOMER_ID', '$SERVICE_ID_SELECTED', '$SERVICE_TIME')")
fi

SERVICE_NAME=$($PSQL "SELECT services.name FROM appointments LEFT JOIN customers USING(customer_id) LEFT JOIN services USING(service_id);")

echo "I have put you down for '$SERVICE_NAME' at '$SERVICE_TIME', '$CUSTOMER_NAME'"



# 3 444-4444 Nathan 10:30

# STOPPED WITH -> fixing bugs and looping.