CREATE TABLE galaxy(
    galaxy_id BIGSERIAL PRIMARY KEY NOT NULL,
    name VARCHAR(50) UNIQUE NOT NULL,
    galaxy_type VARCHAR(50) NOT NULL,
    galaxy_constellation TEXT NOT NULL,
    estimated_stars BIGINT NOT NULL,
    estimated_planets BIGINT NOT NULL,
    blank INT NOT NULL,
    blank_2 INT NOT NULL
);

CREATE TABLE star(
    star_id BIGSERIAL PRIMARY KEY NOT NULL,
    name VARCHAR(50) UNIQUE NOT NULL,
    star_type VARCHAR NOT NULL,
    galaxy_id BIGINT REFERENCES galaxy(galaxy_id) NOT NULL,
    orbiting_planets INT NOT NULL,
    blank INT NOT NULL,
    blank_2 INT NOT NULL
);

CREATE TABLE planet(
    planet_id BIGSERIAL PRIMARY KEY NOT NULL,
    name VARCHAR(50) UNIQUE NOT NULL,
    planet_type VARCHAR(50) NOT NULL,
    star_id BIGINT REFERENCES star(star_id) NOT NULL,
    planet_satellites_bool BOOLEAN,
    planet_satellites INT NOT NULL,
    planet_has_rings BOOLEAN,
    blank INT NOT NULL,
    blank_2 INT NOT NULL
);

CREATE TABLE moon(
    moon_id BIGSERIAL PRIMARY KEY NOT NULL,
    name VARCHAR(50) UNIQUE NOT NULL,
    planet_id BIGINT REFERENCES planet(planet_id) NOT NULL,
    moon_orbital_speed_kms INT NOT NULL,
    moon_orbit_time INT NOT NULL,
    blank INT NOT NULL,
    blank_2 INT NOT NULL
);

CREATE TABLE black_hole(
    black_hole_id BIGSERIAL PRIMARY KEY NOT NULL,
    name VARCHAR(50) UNIQUE NOT NULL,
    bh_type VARCHAR(50) NOT NULL,
    galaxy_id INT REFERENCES galaxy(galaxy_id),
    bh_solar_mass NUMERIC NOT NULL,
    blank INT NOT NULL,
    blank_2 INT NOT NULL
);



INSERT INTO galaxy(name, galaxy_type, galaxy_constellation, estimated_stars, estimated_planets, blank, blank_2) 
VALUES('Andromeda Galaxy', 'Barred Spiral Galaxy', 'Andromeda', 1000000000000, 1000000000, 1, 1);
INSERT INTO galaxy(name, galaxy_type, galaxy_constellation, estimated_stars, estimated_planets, blank, blank_2) 
VALUES('Milky Way Galaxy', 'Barred Spiral Galaxy', 'Sagittarius', 100000000000, 100000000000, 1, 1);
INSERT INTO galaxy(name, galaxy_type, galaxy_constellation, estimated_stars, estimated_planets, blank, blank_2) 
VALUES('Triangulum Galaxy', 'Spiral Galaxy', 'Triangulum', 400000000000, 400000000000, 1, 1);
INSERT INTO galaxy(name, galaxy_type, galaxy_constellation, estimated_stars, estimated_planets, blank, blank_2) 
VALUES ('Pinwheel Galaxy', 'Spirial Galaxy', 'Ursa Major', 1000000000000, 1000000000000, 1, 1);
INSERT INTO galaxy(name, galaxy_type, galaxy_constellation, estimated_stars, estimated_planets, blank, blank_2) 
VALUES ('Black Eye Galaxy', 'Spirial Galaxy', 'Coma Berenices', 100000000000, 100000000000, 1, 1);
INSERT INTO galaxy(name, galaxy_type, galaxy_constellation, estimated_stars, estimated_planets, blank, blank_2) 
VALUES ('Hoag`s Object Galaxy', 'Ring Galaxy', 'Serpens Caput', 100000000000, 100000000000, 1, 1);

INSERT INTO star(name, star_type, galaxy_id, orbiting_planets, blank, blank_2) 
VALUES('The Sun', 'G type', 2, 8, 1, 1);
INSERT INTO star(name, star_type, galaxy_id, orbiting_planets, blank, blank_2) 
VALUES('Kepler-11', 'Solar-type', 2, 6, 1, 1);
INSERT INTO star(name, star_type, galaxy_id, orbiting_planets, blank, blank_2) 
VALUES('Kepler-90', 'F-Type', 2, 8, 1, 1);
INSERT INTO star(name, star_type, galaxy_id, orbiting_planets, blank, blank_2) 
VALUES('Proxima Centauri', 'Low-mass', 3, 3, 1, 1);
INSERT INTO star(name, star_type, galaxy_id, orbiting_planets, blank, blank_2) 
VALUES('Tau Ceti', 'Solar-Type', 2, 8, 1, 1);
INSERT INTO star(name, star_type, galaxy_id, orbiting_planets, blank, blank_2) 
VALUES('TRAPPIST', 'Red Dwarf', 2, 7, 1, 1);

INSERT INTO planet(name, planet_type, star_id, planet_satellites_bool, planet_satellites, planet_has_rings, blank, blank_2) 
VALUES('Jupiter', 'Gas Giant', 1, true, 80, false, 1, 1);
INSERT INTO planet(name, planet_type, star_id, planet_satellites_bool, planet_satellites, planet_has_rings, blank, blank_2) 
VALUES('Saturn', 'Gas Giant', 1, true, 83, true, 1, 1);
INSERT INTO planet(name, planet_type, star_id, planet_satellites_bool, planet_satellites, planet_has_rings, blank, blank_2) 
VALUES('Uranus', 'Ice Giant', 1, true, 27, false, 1, 1);
INSERT INTO planet(name, planet_type, star_id, planet_satellites_bool, planet_satellites, planet_has_rings, blank, blank_2) 
VALUES('Neptune', 'Ice Giant', 1, true, 14, false, 1, 1);
INSERT INTO planet(name, planet_type, star_id, planet_satellites_bool, planet_satellites, planet_has_rings, blank, blank_2) 
VALUES('Mercury', 'Terrestrial', 1, false, 0, false, 1, 1);
INSERT INTO planet(name, planet_type, star_id, planet_satellites_bool, planet_satellites, planet_has_rings, blank, blank_2) 
VALUES('Venus', 'Terrestrial', 1, false, 0, false, 1, 1);
INSERT INTO planet(name, planet_type, star_id, planet_satellites_bool, planet_satellites, planet_has_rings, blank, blank_2) 
VALUES('Earth', 'Terrestrial', 1, true, 1, false, 1, 1);
INSERT INTO planet(name, planet_type, star_id, planet_satellites_bool, planet_satellites, planet_has_rings, blank, blank_2) 
VALUES('Mars', 'Terrestrial', 1, true, 2, false, 1, 1);
INSERT INTO planet(name, planet_type, star_id, planet_satellites_bool, planet_satellites, planet_has_rings, blank, blank_2) 
VALUES('Pluto', 'Dwarf', 1, true, 5, false, 1, 1);
INSERT INTO planet(name, planet_type, star_id, planet_satellites_bool, planet_satellites, planet_has_rings, blank, blank_2) 
VALUES('Makemake', 'Dwarf', 1, true, 1, false, 1, 1);
INSERT INTO planet(name, planet_type, star_id, planet_satellites_bool, planet_satellites, planet_has_rings, blank, blank_2) 
VALUES('Haumea', 'Dwarf', 1, true, 2, false, 1, 1);
INSERT INTO planet(name, planet_type, star_id, planet_satellites_bool, planet_satellites, planet_has_rings, blank, blank_2) 
VALUES('50000 Quaoar', 'Dwarf', 1, true, 1, false, 1, 1);

INSERT INTO moon(name, planet_id, moon_orbital_speed_kms, moon_orbit_time, blank, blank_2) 
VALUES('Metis', 1, 1, 1, 1, 1);
INSERT INTO moon(name, planet_id, moon_orbital_speed_kms, moon_orbit_time, blank, blank_2) 
VALUES('Adrastea', 1, 31, 1, 1, 1);
INSERT INTO moon(name, planet_id, moon_orbital_speed_kms, moon_orbit_time, blank, blank_2) 
VALUES('Amalthea', 1, 26, 1, 1, 1);
INSERT INTO moon(name, planet_id, moon_orbital_speed_kms, moon_orbit_time, blank, blank_2) 
VALUES('Thebe', 1, 23, 1, 1, 1);
INSERT INTO moon(name, planet_id, moon_orbital_speed_kms, moon_orbit_time, blank, blank_2) 
VALUES('Io', 1, 17, 2, 1, 1);
INSERT INTO moon(name, planet_id, moon_orbital_speed_kms, moon_orbit_time, blank, blank_2) 
VALUES('Europa', 1, 13, 4, 1, 1);
INSERT INTO moon(name, planet_id, moon_orbital_speed_kms, moon_orbit_time, blank, blank_2) 
VALUES('Ganymede', 1, 10, 7, 1, 1);
INSERT INTO moon(name, planet_id, moon_orbital_speed_kms, moon_orbit_time, blank, blank_2) 
VALUES('Callisto', 1, 8, 16, 1, 1);
INSERT INTO moon(name, planet_id, moon_orbital_speed_kms, moon_orbit_time, blank, blank_2) 
VALUES('Themisto', 1, 1, 129, 1, 1);
INSERT INTO moon(name, planet_id, moon_orbital_speed_kms, moon_orbit_time, blank, blank_2) 
VALUES('Leda', 1, 1, 242, 1, 1);
INSERT INTO moon(name, planet_id, moon_orbital_speed_kms, moon_orbit_time, blank, blank_2) 
VALUES('Ersa', 1, 1, 252, 1, 1);
INSERT INTO moon(name, planet_id, moon_orbital_speed_kms, moon_orbit_time, blank, blank_2) 
VALUES('Himalia', 1, 1, 248, 1, 1);
INSERT INTO moon(name, planet_id, moon_orbital_speed_kms, moon_orbit_time, blank, blank_2) 
VALUES('Pandia', 1, 1, 252, 1, 1);
INSERT INTO moon(name, planet_id, moon_orbital_speed_kms, moon_orbit_time, blank, blank_2) 
VALUES('Lysithea', 1, 1, 258, 1, 1);
INSERT INTO moon(name, planet_id, moon_orbital_speed_kms, moon_orbit_time, blank, blank_2) 
VALUES('Elara', 1, 1, 258, 1, 1);
INSERT INTO moon(name, planet_id, moon_orbital_speed_kms, moon_orbit_time, blank, blank_2) 
VALUES('Dia', 1, 1, 287, 1, 1);
INSERT INTO moon(name, planet_id, moon_orbital_speed_kms, moon_orbit_time, blank, blank_2) 
VALUES('Carpo', 1, 1, 456, 1, 1);
INSERT INTO moon(name, planet_id, moon_orbital_speed_kms, moon_orbit_time, blank, blank_2) 
VALUES('Valetudo', 1, 1, 500, 1, 1);
INSERT INTO moon(name, planet_id, moon_orbital_speed_kms, moon_orbit_time, blank, blank_2) 
VALUES('Euporie', 1, 1, 550, 1, 1);
INSERT INTO moon(name, planet_id, moon_orbital_speed_kms, moon_orbit_time, blank, blank_2) 
VALUES('Jupiter LV', 1, 1, 604, 1, 1);

INSERT INTO black_hole(name, bh_type, galaxy_id, bh_solar_mass, blank, blank_2) 
VALUES('TON 618', 'Quasar', 2, 66000000000, 1, 1);
INSERT INTO black_hole(name, bh_type, galaxy_id, bh_solar_mass, blank, blank_2) 
VALUES('Messier 31', 'Supermassive', 1, 120000000000, 1, 1);
INSERT INTO black_hole(name, bh_type, galaxy_id, bh_solar_mass, blank, blank_2) 
VALUES('4C', 'Binary', 3, 11000000000, 1, 1);
INSERT INTO black_hole(name, bh_type, galaxy_id, bh_solar_mass, blank, blank_2) 
VALUES('Sagittarius A*','Supermassive', 2, 11000000000, 1, 1);
INSERT INTO black_hole(name, bh_type, galaxy_id, bh_solar_mass, blank, blank_2) 
VALUES('NGC 5033', 'Supermassive', 5, 11000000000, 1, 1);
INSERT INTO black_hole(name, bh_type, galaxy_id, bh_solar_mass, blank, blank_2) 
VALUES('RX J11', 'Supermasive', 6, 11000000000, 1, 1);
