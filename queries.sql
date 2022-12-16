/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name FROM animals WHERE neutered = true AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu';
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = true; 
SELECT * FROM animals WHERE name NOT IN ('Gabumon');
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;


/*JOIN Queries*/
SELECT * FROM animals INNER JOIN owners ON animals.owner_id = owners.id WHERE owners.full_name = 'Melody Pond';
SELECT * FROM animals INNER JOIN species ON animals.species_id = species.id WHERE species.name = 'Pokemon';
SELECT * FROM owners FULL OUTER JOIN animals ON owners.id = animals.owner_id;
SELECT species.name, COUNT(*) FROM animals INNER JOIN species ON animals.species_id = species.id GROUP BY species.name;
SELECT * FROM animals INNER JOIN owners ON animals.owner_id = owners.id INNER JOIN species ON animals.species_id = species.id WHERE owners.full_name = 'Jennifer Orwell' AND species.name = 'Digimon';
SELECT * FROM  animals INNER JOIN owners ON animals.owner_id = owners.id WHERE owners.full_name = 'Jennifer Orwell' AND animals.escape_attempts = 0;
SELECT full_name, COUNT(*) FROM owners INNER JOIN animals ON owners.id = animals.owner_id GROUP BY animals.full_name ORDER BY COUNT(animals.owner_id) DESC LIMIT 1;
