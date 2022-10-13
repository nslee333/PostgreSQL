
Tables: 
	- Galaxy, Star, Planet, Moon

		Galaxy x 6
			- galaxy_id (bigserial, pkey, not null), 
			- galaxy_name (varchar, not null, UNIQUE),
			- galaxy_type (varchar, not null),
			- galaxy_constellation (TEXT, not null), 
			- estimated_stars (numeric, NOT NULL), 
			- estimated_planets (numeric, NOT NULL) 

		Star x 6
			- star_id (bigserial, pkey, not null), 
			- star_name (VARCHAR, not null, UNIQUE), 
			- star_type (VARCHAR, not null), 
			- galaxy_id (foreign key, REFERENCE relate to galaxy, not null), 
			- orbiting_planets(numeric, not null),  

		Planet x 12
			- planet_id(bigserial, pkey, NOT NULL), 
			- planet_name (varchar, UNIQUE, NOT NULL), 
			- planet_type (composition, varchar, NOT NULL), 
			- star_id(foreign key to Star, NOT NULL),
			- planet_satelites_bool(boolean)
			- planet_number_of_satellites(numeric, amount of moons)
			- planet_has_rings(boolean)

		Moon x 20
			- moon_id(bigserial, pkey, NOT NULL),
			- moon_name(varchar, NOT NULL, UNIQUE),
			- planet_id(REFERENCES planet_id)
			- moon_orbital_speed_in_kms(INT, not null),
			- moon_orbit_time_in_days(INT, not null),

		Black Hole x 6 (in galaxies)
			- bh_id (bigserial, not null, )
			- bh_name (varchar, unique, not null)
			- bh_type(varchar, not null)
			- galaxy_id(references, not null)
			- bh_solar_mass(numeric, not null)

Gather data here:

	Galaxies x 6
		- VALUES('Andromeda Galaxy', 'Barred Spiral Galaxy', 'Andromeda Constellation', 1000000000000, 1000000000);
		- VALUES('Milky Way Galaxy', 'Barred Spiral Galaxy', 'Sagittarius', 100000000000, 100000000000);
		- VALUES('Triangulum Galaxy', 'Spiral Galaxy', 'Triangulum', 400000000000, 400000000000);
		- VALUES ('Pinwheel Galaxy', 'Spirial Galaxy', 'Ursa Major', 1000000000000, 1000000000000);
		- VALUES ('Black Eye Galaxy', 'Spirial Galaxy', 'Coma Berenices', 100000000000, 100000000000);
		- VALUES ('Hoag's Object Galaxy', 'Ring Galaxy', 'Serpens Caput', 100000000000, 100000000000);

	Stars x 6
		- VALUES('The Sun', 'G type', 2, 8);
		- VALUES('Kepler-11', 'Solar-type', 2, 6);
		- VALUES('Kepler-90', 'F-Type', 2, 8);
		- VALUES('Proxima Centauri', 'Low-mass', 3, 3);
		- VALUES('Tau Ceti', 'Solar-Type', 2, 8);
		- VALUES('TRAPPIST', 'Red Dwarf', 2, 7);

	Planets x 12
		'Jupiter', 'Gas Giant', 1, true, 80, false
		'Saturn', 'Gas Giant', 1, true, 83, true
		'Uranus', 'Ice Giant', 1, true, 27, false
		'Neptune', 'Ice Giant', 1, true, 14, false
		'Mercury', 'Terrestrial', 1, false, 0, false 
		'Venus', 'Terrestrial', 1, false, 0, false,
		'Earth', 'Terrestrial', 1, true, 1, false,
		'Mars', 'Terrestrial', 1, true, 2, false,
		'Pluto', 'Dwarf', 1, true, 5, false 
		'Makemake', 'Dwarf', 1, true, 1, false,
		'Haumea', 'Dwarf', 1, true, 2, false,
		'50000 Quaoar', 'Dwarf', true, 1, false
	
	Moons x 20
		'Metis', 1, 1, 1
		'Adrastea', 1, 31, 1
		'Amalthea', 1, 26, 1
		'Thebe', 1, 23, 1
		'Io', 1, 17, 2
		'Europa', 1, 13, 4
		'Ganymede', 1, 10, 7
		'Callisto', 1, 8, 16
		'Themisto', 1, 1, 129
		'Leda', 1, 1, 242
		'Ersa', 1, 1, 252
		'Himalia', 1, 1, 248
		'Pandia', 1, 1, 252
		'Lysithea', 1, 1, 258
		'Elara', 1, 1, 258
		'Dia', 1, 1, 287
		'Carpo', 1, 1, 456
		'Valetudo', 1, 1, 500
		'Euporie', 1, 1, 550
		'Jupiter LV', 1, 1, 604

	Black Holes x 6
		'TON 618', 'Quasar', 2, 66000000000
		'Messier 31', 'Supermassive', 1, 120000000000
		'4C', 'Binary', 3, 11000000000
		'Sagittarius A*', 2, 11000000000
		'NGC 5033', 5, 11000000000
		'RX J11', 6, 11000000000