-- veterinary.sql
-- Database for Veterinary Clinic

-- Feature 1: Create database
CREATE DATABASE IF NOT EXISTS veterinary_clinic;
USE veterinary_clinic;

-- Feature 2: Create tables
CREATE TABLE IF NOT EXISTS pets (
    pet_id INT PRIMARY KEY AUTO_INCREMENT,
    pet_name VARCHAR(100) NOT NULL,
    species VARCHAR(50),
    breed VARCHAR(50),
    age INT,
    owner_name VARCHAR(100),
    visit_date DATE
);

CREATE TABLE IF NOT EXISTS owners (
    owner_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    contact_number VARCHAR(15),
    email VARCHAR(100)
);

-- Feature 3: Insert sample data
INSERT INTO pets (pet_name, species, breed, age, owner_name, visit_date) 
VALUES 
    ('Max', 'Dog', 'Golden Retriever', 3, 'Christine De Chavez', '2025-11-29'),
    ('Whiskers', 'Cat', 'Siamese', 5, 'Angelica Aguba', '2025-10-20'),
    ('Buddy', 'Dog', 'Labrador', 2, 'Irish Fampulme', '2025-09-25');

INSERT INTO owners (first_name, last_name, contact_number, email)
VALUES
    ('Christine', 'De Chavez', '09928954509', 'dechavezchristine0@gmail.com'),
    ('Angelica', 'Aguba', '09944994958', 'agubaangelica07@gmail.com');

-- Feature 4: SELECT queries
-- Query 1: Show all pets
SELECT * FROM pets;

-- Query 2: Show pets older than 2 years
SELECT pet_name, species, age FROM pets WHERE age > 2;

-- Query 3: Count pets by species
SELECT species, COUNT(*) as total_pets FROM pets GROUP BY species;

-- Query 4: Show pets with owner info
SELECT p.pet_name, p.species, o.first_name, o.last_name 
FROM pets p 
LEFT JOIN owners o ON p.owner_name = CONCAT(o.first_name, ' ', o.last_name);