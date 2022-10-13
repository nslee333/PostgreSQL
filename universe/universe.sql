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



INSERT INTO galaxy(galaxy_name, galaxy_type, galaxy_constellation, estimated_stars, estimated_planets) VALUES();
INSERT INTO galaxy(galaxy_name, galaxy_type, galaxy_constellation, estimated_stars, estimated_planets) VALUES();
INSERT INTO galaxy(galaxy_name, galaxy_type, galaxy_constellation, estimated_stars, estimated_planets) VALUES();
INSERT INTO galaxy(galaxy_name, galaxy_type, galaxy_constellation, estimated_stars, estimated_planets) VALUES();
INSERT INTO galaxy(galaxy_name, galaxy_type, galaxy_constellation, estimated_stars, estimated_planets) VALUES();
INSERT INTO galaxy(galaxy_name, galaxy_type, galaxy_constellation, estimated_stars, estimated_planets) VALUES();

INSERT INTO star(star_name, star_type, galaxy_id, orbiting_planets) VALUES();
INSERT INTO star(star_name, star_type, galaxy_id, orbiting_planets) VALUES();
INSERT INTO star(star_name, star_type, galaxy_id, orbiting_planets) VALUES();
INSERT INTO star(star_name, star_type, galaxy_id, orbiting_planets) VALUES();
INSERT INTO star(star_name, star_type, galaxy_id, orbiting_planets) VALUES();
INSERT INTO star(star_name, star_type, galaxy_id, orbiting_planets) VALUES();

INSERT INTO planet(planet_name, planet_type, star_id, planet_satellites_bool, planet_satellites, planet_has_rings) VALUES();
INSERT INTO planet(planet_name, planet_type, star_id, planet_satellites_bool, planet_satellites, planet_has_rings) VALUES();
INSERT INTO planet(planet_name, planet_type, star_id, planet_satellites_bool, planet_satellites, planet_has_rings) VALUES();
INSERT INTO planet(planet_name, planet_type, star_id, planet_satellites_bool, planet_satellites, planet_has_rings) VALUES();
INSERT INTO planet(planet_name, planet_type, star_id, planet_satellites_bool, planet_satellites, planet_has_rings) VALUES();
INSERT INTO planet(planet_name, planet_type, star_id, planet_satellites_bool, planet_satellites, planet_has_rings) VALUES();
INSERT INTO planet(planet_name, planet_type, star_id, planet_satellites_bool, planet_satellites, planet_has_rings) VALUES();
INSERT INTO planet(planet_name, planet_type, star_id, planet_satellites_bool, planet_satellites, planet_has_rings) VALUES();
INSERT INTO planet(planet_name, planet_type, star_id, planet_satellites_bool, planet_satellites, planet_has_rings) VALUES();
INSERT INTO planet(planet_name, planet_type, star_id, planet_satellites_bool, planet_satellites, planet_has_rings) VALUES();
INSERT INTO planet(planet_name, planet_type, star_id, planet_satellites_bool, planet_satellites, planet_has_rings) VALUES();
INSERT INTO planet(planet_name, planet_type, star_id, planet_satellites_bool, planet_satellites, planet_has_rings) VALUES();

INSERT INTO moon(moon_name, planet_id, moon_orbital_speed_kms, moon_orbit_time) VALUES();
INSERT INTO moon(moon_name, planet_id, moon_orbital_speed_kms, moon_orbit_time) VALUES();
INSERT INTO moon(moon_name, planet_id, moon_orbital_speed_kms, moon_orbit_time) VALUES();
INSERT INTO moon(moon_name, planet_id, moon_orbital_speed_kms, moon_orbit_time) VALUES();
INSERT INTO moon(moon_name, planet_id, moon_orbital_speed_kms, moon_orbit_time) VALUES();
INSERT INTO moon(moon_name, planet_id, moon_orbital_speed_kms, moon_orbit_time) VALUES();
INSERT INTO moon(moon_name, planet_id, moon_orbital_speed_kms, moon_orbit_time) VALUES();
INSERT INTO moon(moon_name, planet_id, moon_orbital_speed_kms, moon_orbit_time) VALUES();
INSERT INTO moon(moon_name, planet_id, moon_orbital_speed_kms, moon_orbit_time) VALUES();
INSERT INTO moon(moon_name, planet_id, moon_orbital_speed_kms, moon_orbit_time) VALUES();
INSERT INTO moon(moon_name, planet_id, moon_orbital_speed_kms, moon_orbit_time) VALUES();
INSERT INTO moon(moon_name, planet_id, moon_orbital_speed_kms, moon_orbit_time) VALUES();
INSERT INTO moon(moon_name, planet_id, moon_orbital_speed_kms, moon_orbit_time) VALUES();
INSERT INTO moon(moon_name, planet_id, moon_orbital_speed_kms, moon_orbit_time) VALUES();
INSERT INTO moon(moon_name, planet_id, moon_orbital_speed_kms, moon_orbit_time) VALUES();
INSERT INTO moon(moon_name, planet_id, moon_orbital_speed_kms, moon_orbit_time) VALUES();
INSERT INTO moon(moon_name, planet_id, moon_orbital_speed_kms, moon_orbit_time) VALUES();
INSERT INTO moon(moon_name, planet_id, moon_orbital_speed_kms, moon_orbit_time) VALUES();
INSERT INTO moon(moon_name, planet_id, moon_orbital_speed_kms, moon_orbit_time) VALUES();
INSERT INTO moon(moon_name, planet_id, moon_orbital_speed_kms, moon_orbit_time) VALUES();

INSERT INTO black_hole(bh_name, bh_type, galaxy_id, bh_solar_mass) VALUES();
INSERT INTO black_hole(bh_name, bh_type, galaxy_id, bh_solar_mass) VALUES();
INSERT INTO black_hole(bh_name, bh_type, galaxy_id, bh_solar_mass) VALUES();
INSERT INTO black_hole(bh_name, bh_type, galaxy_id, bh_solar_mass) VALUES();
INSERT INTO black_hole(bh_name, bh_type, galaxy_id, bh_solar_mass) VALUES();
INSERT INTO black_hole(bh_name, bh_type, galaxy_id, bh_solar_mass) VALUES();
