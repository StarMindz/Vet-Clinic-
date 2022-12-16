/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id                 INT,
    name               VARCHAR,
    date_of_birth      DATE,
    escape_attempts    INT,
    neutered           BOOLEAN,
    weight_kg          DECIMAL,
    PRIMARY KEY(id)
);



CREATE TABLE vets (
    id BIGSERIAL NOT NULL,
    name VARCHAR,
    age INTEGER,
    date_of_graduation DATE,
    PRIMARY KEY(id)
);

CREATE TABLE specializations (
    species_id INTEGER REFERENCES species(id),
    vet_id INTEGER REFERENCES vets(id)
);

CREATE TABLE visits (
    animal_id INTEGER REFERENCES animals(id),
    vet_id INTEGER REFERENCES vets(id),
    date_of_visit DATE
);

