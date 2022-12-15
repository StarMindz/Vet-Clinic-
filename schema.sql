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

CREATE TABLE owners (
    id BIGSERIAL NOT NULL,
    full_name VARCHAR(255),
    age INTEGER,
    PRIMARY KEY(id)
);

CREATE TABLE species (
    id BIGSERIAL NOT NULL,
    name VARCHAR(255),
    PRIMARY KEY(id)
);

ALTER TABLE animals
ALTER COLUMN id TYPE SERIAL;
