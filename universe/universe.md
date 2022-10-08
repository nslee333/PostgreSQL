
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

	Stars x 6

	Planets x 12

	Moons x 20

	Black Holes x 6





