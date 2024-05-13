USE starwars;

CREATE TABLE film (
    film_id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    release_year INTEGER,
    director VARCHAR(100)
);

CREATE TABLE world (
    world_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    gravity VARCHAR(50)
);

CREATE TABLE people (
    people_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255),
    height VARCHAR(255),
    mass VARCHAR(255),
    hairColor VARCHAR(255),
    gender VARCHAR(255),
    dob VARCHAR(255),
    img VARCHAR(255),
    world_id INTEGER REFERENCES world(world_id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE people_film (
    people_id INTEGER REFERENCES people(people_id),
    film_id INTEGER REFERENCES movie(film_id),
    PRIMARY KEY (people_id, film_id)
);


INSERT INTO film (title, release_year, director) VALUES ('A New Hope', 1977, 'George Lucas'), ('The Empire Strikes Back', 1980, 'Irvin Kershner'), ('Return of the Jedi', 1983, 'Richard Marquand'), ('The Phantom Menace', 1999, 'George Lucas'), ('Attack of the Clones', 2002, 'George Lucas'), ('Revenge of the Sith', 2005, 'George Lucas'), ('The Force Awakens', 2015, 'J.J. Abrams'), ('Rogue One', 2016, 'Gareth Edwards'), ('The Last Jedi', 2017, 'Rian Johnson');
INSERT INTO world (name, gravity) VALUES ('Tatooine', '1 standard'), ('Alderaan', '1 standard'), ('Yavin IV', '1 standard'), ('Hoth', '1.1 standard'), ('Dagobah', 'N/A'), ('Bespin', '1.5 standard'), ('Endor', '0.85 standard'), ('Naboo', '1 standard'), ('Coruscant', '1 standard'), ('Kamino', '1 standard'), ('Geonosis', '0.9 standard'), ('Utapau', '1 standard'), ('Mustafar', '1 standard'), ('Kashyyyk', '1 standard'), ('Polis Massa', '0.56 standard'), ('Mygeeto', '1 standard'), ('Felucia', '0.75 standard'), ('Cato Neimoidia', '1 standard'), ('Saleucami', '0.75 standard'), ('Stewjon', '1 standard'), ('Eriadu', '1 standard'), ('Corellia', '1 standard'), ('Rodia', '1 standard'), ('Nal Hutta', '1 standard'), ('Dantooine', '1 standard'), ('Bestine IV', '1 standard'), ('Ord Mantell', '1 standard'), ('unknown', '1 standard'), ('Trandosha', '0.62 standard'), ('Socorro', '1 standard'), ('Mon Cala', '1.5 standard'), ('Chandrila', '1 standard'), ('Sullust', '1 standard'), ('Toydaria', '1 standard'), ('Malastare', '1.56 standard'), ('Dathomir', '0.9 standard'), ('Ryloth', '1 standard'), ('Aleen Minor', '1 standard'), ('Vulpter', '1 standard'), ('Troiken', '1 standard'), ('Tund', '1 standard'), ('Haruun Kal', '0.98 standard'), ('Cerea', '1 standard'), ('Glee Anselm', '1 standard'), ('Iridonia', '1 standard'), ('Tholoth', '1.2 standard'), ('Iktotch', '1.5 standard'), ('Quermia', '1 standard'), ('Dorin', '1 standard');
INSERT INTO people (name, height, mass, hairColor, gender, dob, img, world_id) VALUES ('Han Solo', '180', '80', 'Brown', 'Male', '1977-04-20', 'https://example.com/han.jpg', 1), ('Princess Leia', '150', '49', 'Brown', 'Female', '1977-04-20', 'https://example.com/leia.jpg', 2), ('Darth Vader', '202', '136', 'None', 'Male', '1977-04-20', 'https://example.com/vader.jpg', 3), ('Obi-Wan Kenobi', '182', '77', 'Gray', 'Male', '1977-04-20', 'https://example.com/obiwan.jpg', 4), ('Yoda', '66', '17', 'None', 'Male', '1977-04-20', 'https://example.com/yoda.jpg', 5), ('Chewbacca', '228', '112', 'Brown', 'Male', '1977-04-20', 'https://example.com/chewbacca.jpg', 6), ('R2-D2', '96', '32', 'None', 'Male', '1977-04-20', 'https://example.com/r2d2.jpg', 7), ('C-3PO', '167', '75', 'Gold', 'Male', '1977-04-20', 'https://example.com/c3po.jpg', 8), ('Lando Calrissian', '177', '79', 'Black', 'Male', '1980-05-17', 'https://example.com/lando.jpg', 9), ('Boba Fett', '183', '78', 'Brown', 'Male', '1980-05-17', 'https://example.com/boba.jpg', 10), ('Emperor Palpatine', '170', '75', 'None', 'Male', '1980-05-17', 'https://example.com/palpatine.jpg', 11), ('Anakin Skywalker', '188', '84', 'Blond', 'Male', '1980-05-17', 'https://example.com/anakin.jpg', 12), ('Padmé Amidala', '165', '45', 'Brown', 'Female', '1980-05-17', 'https://example.com/padme.jpg', 13), ('Qui-Gon Jinn', '193', '89', 'Brown', 'Male', '1999-05-19', 'https://example.com/quigon.jpg', 14), ('Mace Windu', '188', '84', 'Black', 'Male', '1999-05-19', 'https://example.com/mace.jpg', 15), ('Count Dooku', '193', '86', 'White', 'Male', '1999-05-19', 'https://example.com/dooku.jpg', 16), ('Darth Maul', '175', '80', 'None', 'Male', '1999-05-19', 'https://example.com/maul.jpg', 17), ('Jango Fett', '183', '79', 'Black', 'Male', '2002-05-16', 'https://example.com/jango.jpg', 18), ('General Grievous', '216', '159', 'None', 'Male', '2005-05-19', 'https://example.com/grievous.jpg', 19), ('Rey', '170', '54', 'Brown', 'Female', '2015-12-18', 'https://example.com/rey.jpg', 20), ('Finn', '178', '73', 'Black', 'Male', '2015-12-18', 'https://example.com/finn.jpg', 21), ('Poe Dameron', '182', '80', 'Brown', 'Male', '2015-12-18', 'https://example.com/poe.jpg', 22), ('Kylo Ren', '189', '90', 'Black', 'Male', '2015-12-18', 'https://example.com/kylo.jpg', 23), ('Supreme Leader Snoke', '216', '150', 'None', 'Male', '2015-12-18', 'https://example.com/snoke.jpg', 24), ('BB-8', '67', '18', 'None', 'None', '2015-12-18', 'https://example.com/bb8.jpg', 25), ('Captain Phasma', '200', '76', 'Silver', 'Female', '2015-12-18', 'https://example.com/phasma.jpg', 26), ('Jyn Erso', '170', '55', 'Brown', 'Female', '2016-12-16', 'https://example.com/jyn.jpg', 27), ('Cassian Andor', '175', '78', 'Brown', 'Male', '2016-12-16', 'https://example.com/cassian.jpg', 28), ('K-2SO', '220', '160', 'None', 'None', '2016-12-16', 'https://example.com/k2so.jpg', 29), ('Director Krennic', '180', '80', 'White', 'Male', '2016-12-16', 'https://example.com/krennic.jpg', 30), ('Chirrut Îmwe', '174', '68', 'None', 'Male', '2016-12-16', 'https://example.com/chirrut.jpg', 31), ('Baze Malbus', '183', '80', 'Black', 'Male', '2016-12-16', 'https://example.com/baze.jpg', 32), ('Bodhi Rook', '183', '80', 'Black', 'Male', '2016-12-16', 'https://example.com/bodhi.jpg', 33), ('Saw Gerrera', '183', '80', 'Black', 'Male', '2016-12-16', 'https://example.com/saw.jpg', 34), ('Galen Erso', '183', '80', 'Brown', 'Male', '2016-12-16', 'https://example.com/galen.jpg', 35), ('Orson Krennic', '183', '80', 'White', 'Male', '2016-12-16', 'https://example.com/orson.jpg', 36);
insert INTO people_film (people_id, film_id) values (1, 1), (1, 7), (1, 8), (2, 4), (2, 8), (3, 2), (5, 5), (5, 6), (5, 7), (6, 2), (6, 4), (6, 5), (7, 1), (7, 4), (8, 2), (8, 5), (8, 8), (10, 2), (11, 8), (13, 1), (13, 3), (13, 5), (13, 6), (14, 5), (15, 2), (15, 9), (16, 4), (16, 7), (17, 1), (17, 6), (17, 8), (18, 3), (20, 4), (20, 9), (21, 3), (21, 9), (22, 3), (22, 4), (22, 5), (22, 7), (23, 3), (24, 1), (24, 3), (24, 8), (25, 4), (25, 6), (26, 1), (26, 6), (27, 6), (28, 6), (29, 3), (29, 4), (29, 6), (30, 7), (30, 9), (31, 2), (31, 5), (31, 7), (31, 8), (33, 3), (34, 5), (34, 8), (34, 9);


-- SELECT * FROM people JOIN people_film ON people.people_id = people_film.people_id JOIN film ON people_film.film_id = film.film_id JOIN world ON people.homeworld_id = world.world_id WHERE people.name like '%Han Solo%' OR film.title like '%Han Solo%' OR world.name like '%Han Solo%' ;

