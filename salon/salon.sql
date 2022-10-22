CREATE DATABASE salon;

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
    # Stopped here :)
);