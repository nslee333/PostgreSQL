-- ALTER TABLE properties RENAME weight TO atomic_mass;
-- ALTER TABLE properties RENAME melting_point TO melting_point_celsius;
-- ALTER TABLE properties RENAME boiling_point TO boiling_point_celsius;
-- ALTER TABLE properties ALTER melting_point_celsius SET NOT NULL;
-- ALTER TABLE properties ALTER boiling_point_celsius SET NOT NULL;

-- ALTER TABLE elements ADD CONSTRAINT myUniqueConstraint UNIQUE(name, symbol);
-- ALTER TABLE elements ALTER name SET NOT NULL;
-- ALTER TABLE elements ALTER symbol SET NOT NULL;

-- ALTER TABLE properties ADD FOREIGN KEY(atomic_number) REFERENCES elements(atomic_number);

-- CREATE TABLE types();
-- ALTER TABLE types ADD COLUMN type_id INT PRIMARY KEY;
-- ALTER TABLE types ADD COLUMN type VARCHAR NOT NULL;
-- INSERT INTO types(type_id, type) VALUES(1, 'metal'), (2, 'nonmetal'), (3, 'metalloid');

-- ALTER TABLE properties ADD COLUMN type_id INT; 
-- ALTER TABLE properties ADD FOREIGN KEY (type_id) REFERENCES types(type_id);

-- UPDATE properties SET type_id = 1 WHERE type = 'metal';
-- UPDATE properties SET type_id = 2 WHERE type = 'nonmetal';
-- UPDATE properties SET type_id = 3 WHERE type = 'metalloid';

-- ALTER TABLE properties ALTER type_id SET NOT NULL;

-- UPDATE elements SET symbol = initcap(symbol);
-- UPDATE properties SET atomic_mass = 6.94 WHERE atomic_number = 3;
-- UPDATE properties SET atomic_mass = 9.0122 WHERE atomic_number = 4;
-- UPDATE properties SET atomic_mass = 1.008 WHERE atomic_number = 1;
-- UPDATE properties SET atomic_mass = 4.0026 WHERE atomic_number = 2;
-- UPDATE properties SET atomic_mass = 12.011 WHERE atomic_number = 6;
-- UPDATE properties SET atomic_mass = 14.007 WHERE atomic_number = 7;
-- UPDATE properties SET atomic_mass = 15.999 WHERE atomic_number = 8;
-- UPDATE properties SET atomic_mass = 10.81 WHERE atomic_number = 5;
-- UPDATE properties SET atomic_mass = 1 WHERE atomic_number = 1000;

-- INSERT INTO elements(atomic_number, symbol, name) VALUES(9, 'F', 'Fluorine');
-- INSERT INTO properties(atomic_number, type, atomic_mass, melting_point_celsius, boiling_point_celsius, type_id) VALUES(9, 'nonmetal', 18.998, -220, -188.1, 2);

-- INSERT INTO elements(atomic_number, symbol, name) VALUES(10, 'Ne', 'Neon');
-- INSERT INTO properties(atomic_number, type, atomic_mass, melting_point_celsius, boiling_point_celsius, type_id) VALUES(10, 'nonmetal', 20.18, -248.6, -246.1, 2);

-- DELETE FROM properties WHERE atomic_number = 1000;
-- DELETE FROM elements WHERE atomic_number = 1000;

-- ALTER TABLE properties DROP COLUMN type;