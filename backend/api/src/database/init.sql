USE starwars;




CREATE TABLE people (
    people_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255),
    height VARCHAR(255),
    mass VARCHAR(255),
    hairColor VARCHAR(255),
    gender VARCHAR(255),
    dob VARCHAR(255),
    img VARCHAR(255),
    homeworld_id INTEGER REFERENCES world(world_id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO people (name, height, mass, hairColor, gender, dob, img, homeworld_id) VALUES ('Luke Skywalker', '172', '77', 'Blond', 'Male', '19BBY', 'https://example.com/luke.jpg', 1), ('Leia Organa', '150', '49', 'Brown', 'Female', '19BBY', 'https://example.com/leia.jpg', 2), ('Han Solo', '180', '80', 'Brown', 'Male', '29BBY', 'https://example.com/han.jpg', 3), ('Chewbacca', '228', '112', 'Brown', 'Male', '200BBY', 'https://example.com/chewbacca.jpg', 3), ('Darth Vader', '202', '136', 'None', 'Male', '41.9BBY', 'https://example.com/vader.jpg', 4), ('Obi-Wan Kenobi', '182', '77', 'Auburn, White', 'Male', '57BBY', 'https://example.com/obiwan.jpg', 1), ('Yoda', '66', '17', 'White', 'Male', '896BBY', 'https://example.com/yoda.jpg', 5), ('R2-D2', '96', '32', 'None', 'N/A', '33BBY', 'https://example.com/r2d2.jpg', 6), ('C-3PO', '167', '75', 'None', 'N/A', '112BBY', 'https://example.com/c3po.jpg', 6), ('Padmé Amidala', '165', '45', 'Brown', 'Female', '46BBY', 'https://example.com/padme.jpg', 7), ('Anakin Skywalker', '188', '84', 'Blond', 'Male', '41.9BBY', 'https://example.com/anakin.jpg', 4), ('Mace Windu', '188', '84', 'Black', 'Male', '72BBY', 'https://example.com/mace.jpg', 8), ('Qui-Gon Jinn', '193', '89', 'Brown', 'Male', '92BBY', 'https://example.com/quigon.jpg', 9), ('Count Dooku', '193', '86', 'White', 'Male', '102BBY', 'https://example.com/dooku.jpg', 10), ('Darth Maul', '175', '80', 'None', 'Male', '54BBY', 'https://example.com/maul.jpg', 11), ('Boba Fett', '183', '78', 'Brown', 'Male', '31.5BBY', 'https://example.com/bobafett.jpg', 12), ('Jabba the Hutt', '175', '1358', 'None', 'Hermaphrodite', '600BBY', 'https://example.com/jabba.jpg', 13), ('Lando Calrissian', '177', '79', 'Black', 'Male', '31BBY', 'https://example.com/lando.jpg', 3), ('Rey', '170', '54', 'Brown', 'Female', '15ABY', 'https://example.com/rey.jpg', 14), ('Finn', '178', '73', 'Black', 'Male', 'unknown', 'https://example.com/finn.jpg', 14); 


CREATE TABLE movie (
    movie_id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    release_year INTEGER,
    director VARCHAR(100),
);

CREATE TABLE people_movie (
    people_movie_id SERIAL PRIMARY KEY,
    people_id INTEGER REFERENCES people(people_id),
    movie_id INTEGER REFERENCES movie(movie_id),
);


CREATE TABLE world (
    world_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    gravity VARCHAR(50),
);