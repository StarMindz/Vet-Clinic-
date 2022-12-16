/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name FROM animals WHERE neutered = true AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu';
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = true; 
SELECT * FROM animals WHERE name NOT IN ('Gabumon');
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

SELECT animals.name AS "Animal Name", vets.name AS "Vet Name", date_of_visit FROM visits 
INNER JOIN vets ON visits.vet_id = vets.id  
INNER JOIN animals ON visits.animals_id = animals.id 
WHERE vets.name = 'William Tatcher' ORDER BY date_of_visit DESC LIMIT 1;

SELECT vets.name AS "Vet Name", COUNT(*) FROM visits 
INNER JOIN vets ON visits.vet_id = vets.id  
INNER JOIN animals ON visits.animals_id = animals.id 
WHERE vets.name = 'Stephanie Mendez' GROUP BY vets.name; 

SELECT * FROM vets 
LEFT JOIN specializations ON vets.id = specializations.vet_id 
LEFT JOIN species ON specializations.species_id = species.id;  

SELECT animals.name AS "Animal Name", vets.name AS "Vet Name" FROM visits 
INNER JOIN animals ON visits.animals_id = animals.id 
INNER JOIN vets ON visits.vet_id = vets.id 
WHERE vets.name = 'Stephanie Mendez' AND date_of_visit BETWEEN '2020-04-01' AND '2020-08-30' GROUP BY animals.name, vets.name;

SELECT animals.name, COUNT(*) FROM visits
INNER JOIN animals ON visits.animals_id = animals.id 
GROUP BY animals.name ORDER BY COUNT(*) DESC;

SELECT vets.name AS "Vet Name", animals.name AS "Animal Name", date_of_visit FROM visits
INNER JOIN animals ON visits.animals_id = animals.id
INNER JOIN vets ON visits.vet_id = vets.id
WHERE vets.name = 'Maisy Smith'
ORDER BY date_of_visit LIMIT 1;

SELECT * FROM visits
INNER JOIN animals ON visits.animals_id = animals.id
INNER JOIN vets ON visits.vet_id = vets.id
ORDER BY date_of_visit LIMIT 1;

SELECT vets.name AS "Vet Name", COUNT(*) FROM visits
FULL OUTER JOIN vets ON visits.vet_id = vets.id 
FULL OUTER JOIN specializations ON specializations.vet_id = vets.id
FULL OUTER JOIN species ON specializations.species_id = species.id
WHERE specializations.species_id IS NULL OR specializations.species_id != species.id 
GROUP BY vets.name;

SELECT vets.name AS "Vet Name", species.name AS "Species", COUNT(*) FROM visits
INNER JOIN Vets ON visits.vet_id = vets.id 
INNER JOIN animals
ON visits.animal_id = animals.id
INNER JOIN species
ON animals.species_id = species.id
WHERE vets.name = 'Maisy Smith'
GROUP BY vets.name,species.name
LIMIT 1;
