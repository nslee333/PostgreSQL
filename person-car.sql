create table person (
    id BIGSERIAL NOT NULL PRIMARY KEY,
        first_name VARCHAR(50) NOT NULL,
        last_name VARCHAR(50) NOT NULL,
        gender VARCHAR(50) NOT NULL,
        email VARCHAR(100),
        date_of_birth DATE NOT NULL,
        country_of_birth VARCHAR(50) NOT NULL
);

create table car (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    make VARCHAR(100) NOT NULL,
    model VARCHAR(100) NOT NULL,
    price NUMERIC(19, 2) NOT NULL
)

INSERT INTO person (first_name, last_name, gender, email, date_of_birth, country_of_birth) VALUES ('Fernanda', 'Beardon', 'Female', 'fb@gmail.com', '1953-10-28', 'Comoros');
INSERT INTO person (first_name, last_name, gender, email, date_of_birth, country_of_birth) VALUES ('Omar', 'Colmore', 'Male', null, '1921-04-03', 'Finland');
INSERT INTO person (first_name, last_name, gender, email, date_of_birth, country_of_birth) VALUES ('John', 'Mutuschek', 'Male', 'jm@gmail.com', '1965-02-28', 'England');

INSERT INTO car(make model, price) VALUES ('Land Rover', 'Sterling', '87665.38');
INSERT INTO car(make model, price) VALUES ('GMC', "Acadia", '17662.69');