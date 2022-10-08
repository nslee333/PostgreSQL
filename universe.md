Tasks for project:
- DB named universe:
- Tables: Galaxy, star, planet, moon.
	- Table should have a primary key + increment (bigserial) -> snake case convention -> moon_id
	- Name -> varchar
	- Int columns not primary or foreign keys
	- Numeric type
	- Text
	- Boolean x2
	- NOT NULL x2
	- Each star -> foreign key -> row in Galaxy [ fkey should have the same name as the column it is referencing.
	- Planet ''       ''               Star
	- Moon	- > planet
	- 5 tables of at least 3 rows.
	- Galaxy and Star: six rows:
	Planet 12 rows
	moon 20 rows
	Each table should have at least 5 columns
	- 





Tables: 
	- Galaxy, Star, Planet, Moon, Commets
	
		Galaxy
			- galaxy_id, 
			- galaxy_name,
			- galaxy_type,
			- galaxy_constellation, 
			- estimated_stars, 
			- estimated_planets 
			- 6 rows
		Star
			- star_id (bigserial, not null primary key), 
			- star_name (VARCHAR), 
			- star_type (VARCHAR), 
			- star_location(galaxy, varchar), 
			- galaxy_id (foreign key, relate to galaxy), 
			- orbiting_planets(numeric),  
			- 6 rows
		Planet
			- planet_id(bigserial, pkey), 
			- planet_name (varchar), 
			- planet_type (composition, varchar), 
			- planet_star(foreign key to Star),
			
		