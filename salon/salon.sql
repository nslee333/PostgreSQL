CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY NOT NULL,
    name VARCHAR(100) NOT NULL,
    phone VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE services (
    service_id SERIAL PRIMARY KEY NOT NULL,
    name VARCHAR(50)
);

CREATE TABLE appointments (
    appointment_id SERIAL PRIMARY KEY NOT NULL,
    customer_id INT REFERENCES customers(customer_id),
    service_id INT REFERENCES services(service_id),
    time VARCHAR(50)
);