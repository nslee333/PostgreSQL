CREATE DATABASE universe;

CREATE TABLE galaxy(
    galaxy_id BIGSERIAL PRIMARY KEY NOT NULL,
    galaxy_name VARCHAR(50) UNIQUE NOT NULL,
    galaxy_type VARCHAR(50) NOT NULL,
    galaxy_constellation TEXT NOT NULL,
    estimated_stars NUMERIC NOT NULL,
    estimated_planets NUMERIC NOT NULL
);

CREATE TABLE star(
    star_id BIGSERIAL PRIMARY KEY NOT NULL,
    star_name VARCHAR(50) UNIQUE NOT NULL,
    star_type VARCHAR NOT NULL,
    galaxy_id BIGINT REFERENCES galaxy(galaxy_id) NOT NULL,
    orbiting_planets NUMERIC NOT NULL
);

CREATE TABLE planet(
    planet_id BIGSERIAL PRIMARY KEY NOT NULL,
    planet_name VARCHAR(50) UNIQUE NOT NULL,
    planet_type VARCHAR(50) NOT NULL,
    star_id BIGINT REFERENCES star(star_id) NOT NULL,
    planet_satellites_bool BOOLEAN,
    planet_satellites NUMERIC NOT NULL,
    planet_has_rings BOOLEAN,
);

CREATE TABLE moon(
    moon_id BIGSERIAL PRIMARY KEY NOT NULL,
    moon_name VARCHAR(50) UNIQUE NOT NULL,
    planet_id BIGINT REFERENCES planet(planet_id) NOT NULL,
    moon_orbital_speed_kms INT NOT NULL,
    moon_orbit_time INT NOT NULL
);

CREATE TABLE black_hole(
    bh_id BIGSERIAL PRIMARY KEY NOT NULL,
    bh_name VARCHAR(50) UNIQUE NOT NULL,
    bh_type VARCHAR(50) NOT NULL,
    galaxy_id INT REFERENCES galaxy(galaxy_id),
    bh_solar_mass NUMERIC NOT NULL
);



INSERT INTO galaxy(galaxy_name, galaxy_type, galaxy_constellation, estimated_stars, estimated_planets) 
VALUES('Andromeda Galaxy', 'Barred Spiral Galaxy', 'Andromeda', 1000000000000, 1000000000);
INSERT INTO galaxy(galaxy_name, galaxy_type, galaxy_constellation, estimated_stars, estimated_planets) 
VALUES('Milky Way Galaxy', 'Barred Spiral Galaxy', 'Sagittarius', 100000000000, 100000000000);
INSERT INTO galaxy(galaxy_name, galaxy_type, galaxy_constellation, estimated_stars, estimated_planets) 
VALUES('Triangulum Galaxy', 'Spiral Galaxy', 'Triangulum', 400000000000, 400000000000);
INSERT INTO galaxy(galaxy_name, galaxy_type, galaxy_constellation, estimated_stars, estimated_planets) 
VALUES ('Pinwheel Galaxy', 'Spirial Galaxy', 'Ursa Major', 1000000000000, 1000000000000);
INSERT INTO galaxy(galaxy_name, galaxy_type, galaxy_constellation, estimated_stars, estimated_planets) 
VALUES ('Black Eye Galaxy', 'Spirial Galaxy', 'Coma Berenices', 100000000000, 100000000000);
INSERT INTO galaxy(galaxy_name, galaxy_type, galaxy_constellation, estimated_stars, estimated_planets) 
VALUES ('Hoag`s Object Galaxy', 'Ring Galaxy', 'Serpens Caput', 100000000000, 100000000000);

INSERT INTO star(star_name, star_type, galaxy_id, orbiting_planets) 
VALUES('The Sun', 'G type', 2, 8);
INSERT INTO star(star_name, star_type, galaxy_id, orbiting_planets) 
VALUES('Kepler-11', 'Solar-type', 2, 6);
INSERT INTO star(star_name, star_type, galaxy_id, orbiting_planets) 
VALUES('Kepler-90', 'F-Type', 2, 8);
INSERT INTO star(star_name, star_type, galaxy_id, orbiting_planets) 
VALUES('Proxima Centauri', 'Low-mass', 3, 3);
INSERT INTO star(star_name, star_type, galaxy_id, orbiting_planets) 
VALUES('Tau Ceti', 'Solar-Type', 2, 8);
INSERT INTO star(star_name, star_type, galaxy_id, orbiting_planets) 
VALUES('TRAPPIST', 'Red Dwarf', 2, 7);

INSERT INTO planet(planet_name, planet_type, star_id, planet_satellites_bool, planet_satellites, planet_has_rings) 
VALUES('Jupiter', 'Gas Giant', 1, true, 80, false);
INSERT INTO planet(planet_name, planet_type, star_id, planet_satellites_bool, planet_satellites, planet_has_rings) 
VALUES('Saturn', 'Gas Giant', 1, true, 83, true);
INSERT INTO planet(planet_name, planet_type, star_id, planet_satellites_bool, planet_satellites, planet_has_rings) 
VALUES('Uranus', 'Ice Giant', 1, true, 27, false);
INSERT INTO planet(planet_name, planet_type, star_id, planet_satellites_bool, planet_satellites, planet_has_rings) 
VALUES('Neptune', 'Ice Giant', 1, true, 14, false);
INSERT INTO planet(planet_name, planet_type, star_id, planet_satellites_bool, planet_satellites, planet_has_rings) 
VALUES('Mercury', 'Terrestrial', 1, false, 0, false);
INSERT INTO planet(planet_name, planet_type, star_id, planet_satellites_bool, planet_satellites, planet_has_rings) 
VALUES('Venus', 'Terrestrial', 1, false, 0, false);
INSERT INTO planet(planet_name, planet_type, star_id, planet_satellites_bool, planet_satellites, planet_has_rings) 
VALUES('Earth', 'Terrestrial', 1, true, 1, false);
INSERT INTO planet(planet_name, planet_type, star_id, planet_satellites_bool, planet_satellites, planet_has_rings) 
VALUES('Mars', 'Terrestrial', 1, true, 2, false);
INSERT INTO planet(planet_name, planet_type, star_id, planet_satellites_bool, planet_satellites, planet_has_rings) 
VALUES('Pluto', 'Dwarf', 1, true, 5, false);
INSERT INTO planet(planet_name, planet_type, star_id, planet_satellites_bool, planet_satellites, planet_has_rings) 
VALUES('Makemake', 'Dwarf', 1, true, 1, false);
INSERT INTO planet(planet_name, planet_type, star_id, planet_satellites_bool, planet_satellites, planet_has_rings) 
VALUES('Haumea', 'Dwarf', 1, true, 2, false);
INSERT INTO planet(planet_name, planet_type, star_id, planet_satellites_bool, planet_satellites, planet_has_rings) 
VALUES('50000 Quaoar', 'Dwarf', true, 1, false);

INSERT INTO moon(moon_name, planet_id, moon_orbital_speed_kms, moon_orbit_time) 
VALUES('Metis', 1, 1, 1);
INSERT INTO moon(moon_name, planet_id, moon_orbital_speed_kms, moon_orbit_time) 
VALUES('Adrastea', 1, 31, 1);
INSERT INTO moon(moon_name, planet_id, moon_orbital_speed_kms, moon_orbit_time) 
VALUES('Amalthea', 1, 26, 1);
INSERT INTO moon(moon_name, planet_id, moon_orbital_speed_kms, moon_orbit_time) 
VALUES('Thebe', 1, 23, 1);
INSERT INTO moon(moon_name, planet_id, moon_orbital_speed_kms, moon_orbit_time) 
VALUES('Io', 1, 17, 2);
INSERT INTO moon(moon_name, planet_id, moon_orbital_speed_kms, moon_orbit_time) 
VALUES('Europa', 1, 13, 4);
INSERT INTO moon(moon_name, planet_id, moon_orbital_speed_kms, moon_orbit_time) 
VALUES('Ganymede', 1, 10, 7);
INSERT INTO moon(moon_name, planet_id, moon_orbital_speed_kms, moon_orbit_time) 
VALUES('Callisto', 1, 8, 16);
INSERT INTO moon(moon_name, planet_id, moon_orbital_speed_kms, moon_orbit_time) 
VALUES('Themisto', 1, 1, 129);
INSERT INTO moon(moon_name, planet_id, moon_orbital_speed_kms, moon_orbit_time) 
VALUES('Leda', 1, 1, 242);
INSERT INTO moon(moon_name, planet_id, moon_orbital_speed_kms, moon_orbit_time) 
VALUES('Ersa', 1, 1, 252);
INSERT INTO moon(moon_name, planet_id, moon_orbital_speed_kms, moon_orbit_time) 
VALUES('Himalia', 1, 1, 248);
INSERT INTO moon(moon_name, planet_id, moon_orbital_speed_kms, moon_orbit_time) 
VALUES('Pandia', 1, 1, 252);
INSERT INTO moon(moon_name, planet_id, moon_orbital_speed_kms, moon_orbit_time) 
VALUES('Lysithea', 1, 1, 258);
INSERT INTO moon(moon_name, planet_id, moon_orbital_speed_kms, moon_orbit_time) 
VALUES('Elara', 1, 1, 258);
INSERT INTO moon(moon_name, planet_id, moon_orbital_speed_kms, moon_orbit_time) 
VALUES('Dia', 1, 1, 287);
INSERT INTO moon(moon_name, planet_id, moon_orbital_speed_kms, moon_orbit_time) 
VALUES('Carpo', 1, 1, 456);
INSERT INTO moon(moon_name, planet_id, moon_orbital_speed_kms, moon_orbit_time) 
VALUES('Valetudo', 1, 1, 500);
INSERT INTO moon(moon_name, planet_id, moon_orbital_speed_kms, moon_orbit_time) 
VALUES('Euporie', 1, 1, 550);
INSERT INTO moon(moon_name, planet_id, moon_orbital_speed_kms, moon_orbit_time) 
VALUES('Jupiter LV', 1, 1, 604);

INSERT INTO black_hole(bh_name, bh_type, galaxy_id, bh_solar_mass) 
VALUES('TON 618', 'Quasar', 2, 66000000000 );
INSERT INTO black_hole(bh_name, bh_type, galaxy_id, bh_solar_mass) 
VALUES('Messier 31', 'Supermassive', 1, 120000000000);
INSERT INTO black_hole(bh_name, bh_type, galaxy_id, bh_solar_mass) 
VALUES('4C', 'Binary', 3, 11000000000);
INSERT INTO black_hole(bh_name, bh_type, galaxy_id, bh_solar_mass) 
VALUES('Sagittarius A*', 2, 11000000000);
INSERT INTO black_hole(bh_name, bh_type, galaxy_id, bh_solar_mass) 
VALUES('NGC 5033', 5, 11000000000);
INSERT INTO black_hole(bh_name, bh_type, galaxy_id, bh_solar_mass) 
VALUES('RX J11', 6, 11000000000);
