Database = salon
    Tables:
        Customers
            name
            phone varchar unique
        Appointments
            foreign key => customer_id customers
            foreign key => service_id services
            time column varchar
        Services
            
            name
            3 rows 

    Primary key serial X 3
    This naming convention => customer_id 


salon.sh
    Display list of services before first prompt
        #) <service>
        1) cut
    If you pick a null service => display list again

    Prompt users to:
        Enter a service id
        phone #
        name(if not in customers)
        time
    READ [ALL] into variables SERVICE_ID_SELECTED, CUSTOMER_PHONE, CUSTOMER_NAME, SERVICE_TIME

    if PHONE = NULL => get name INSERT name, phone INTO customers

    INSERT INTO appointments (using variable names ) with SHELL prompt

    AFTER new appt added:
        I have put you down for <service> at <time>, <name>

    Needs to finish running after completing any tasks.
    


