-- In this assignment, you'll be building the domain model, database 
-- structure, and data for "KMDB" (the Kellogg Movie Database).
-- The end product will be a report that prints the movies and the 
-- top-billed cast for each movie in the database.

-- Requirements/assumptions
--
-- - There will only be three movies in the database – the three films
--   that make up Christopher Nolan's Batman trilogy.
-- - Movie data includes the movie title, year released, MPAA rating,
--   and studio.
-- - There are many studios, and each studio produces many movies, but
--   a movie belongs to a single studio.
-- - An actor can be in multiple movies.
-- - Everything you need to do in this assignment is marked with TODO!

-- User stories
--
-- - As a guest, I want to see a list of movies with the title, year released,
--   MPAA rating, and studio information.
-- - As a guest, I want to see the movies which a single studio has produced.
-- - As a guest, I want to see each movie's cast including each actor's
--   name and the name of the character they portray.
-- - As a guest, I want to see the movies which a single actor has acted in.
-- * Note: The "guest" user role represents the experience prior to logging-in
--   to an app and typically does not have a corresponding database table.


-- Deliverables
-- 
-- There are three deliverables for this assignment, all delivered via
-- this file and submitted via GitHub and Canvas:
-- - A domain model, implemented via CREATE TABLE statements for each
--   model/table. Also, include DROP TABLE IF EXISTS statements for each
--   table, so that each run of this script starts with a blank database.
-- - Insertion of "Batman" sample data into tables.
-- - Selection of data, so that something similar to the sample "report"
--   below can be achieved.

-- Rubric
--
-- 1. Domain model - 6 points
-- - Think about how the domain model needs to reflect the
--   "real world" entities and the relationships with each other. 
--   Hint: It's not just a single table that contains everything in the 
--   expected output. There are multiple real world entities and
--   relationships including at least one many-to-many relationship.
-- 2. Execution of the domain model (CREATE TABLE) - 4 points
-- - Follow best practices for table and column names
-- - Use correct data column types (i.e. TEXT/INTEGER)
-- - Use of the `model_id` naming convention for foreign key columns
-- 3. Insertion of data (INSERT statements) - 4 points
-- - Insert data into all the tables you've created
-- - It actually works, i.e. proper INSERT syntax
-- 4. "The report" (SELECT statements) - 6 points
-- - Write 2 `SELECT` statements to produce something similar to the
--   sample output below - 1 for movies and 1 for cast. You will need
--   to read data from multiple tables in each `SELECT` statement.
--   Formatting does not matter.

-- Submission
-- 
-- - "Use this template" to create a brand-new "hw1" repository in your
--   personal GitHub account, e.g. https://github.com/<USERNAME>/hw1
-- - Do the assignment, committing and syncing often
-- - When done, commit and sync a final time, before submitting the GitHub
--   URL for the finished "hw1" repository as the "Website URL" for the 
--   Homework 1 assignment in Canvas

-- Successful sample output is as shown:

-- Movies
-- ======

-- Batman Begins          2005           PG-13  Warner Bros.
-- The Dark Knight        2008           PG-13  Warner Bros.
-- The Dark Knight Rises  2012           PG-13  Warner Bros.

-- Top Cast
-- ========

-- Batman Begins          Christian Bale        Bruce Wayne
-- Batman Begins          Michael Caine         Alfred
-- Batman Begins          Liam Neeson           Ra's Al Ghul
-- Batman Begins          Katie Holmes          Rachel Dawes
-- Batman Begins          Gary Oldman           Commissioner Gordon
-- The Dark Knight        Christian Bale        Bruce Wayne
-- The Dark Knight        Heath Ledger          Joker
-- The Dark Knight        Aaron Eckhart         Harvey Dent
-- The Dark Knight        Michael Caine         Alfred
-- The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
-- The Dark Knight Rises  Christian Bale        Bruce Wayne
-- The Dark Knight Rises  Gary Oldman           Commissioner Gordon
-- The Dark Knight Rises  Tom Hardy             Bane
-- The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
-- The Dark Knight Rises  Anne Hathaway         Selina Kyle

-- Turns column mode on but headers off
.mode column
.headers off

-- Drop existing tables, so you'll start fresh each time this script is run.
DROP TABLE IF EXISTS movies;
DROP TABLE IF EXISTS characters;
DROP TABLE IF EXISTS casts;

-- Create new tables, according to your domain model
CREATE TABLE movies (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  title TEXT,
  year INTEGER,
  MPAA_rating TEXT,
  studio TEXT
);

CREATE TABLE characters (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  char_name TEXT,
  actor_name TEXT
);

CREATE TABLE casts (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  char_id INTEGER,
  movie_id INTEGER
);

-- Insert data into your database that reflects the sample data shown above
-- Use hard-coded foreign key IDs when necessary

-- Insert data into movies table
INSERT INTO movies (title, year, MPAA_rating, studio)
VALUES ("Batman Begins", 2005, "PG-13", "Warner Bros.");
INSERT INTO movies (title, year, MPAA_rating, studio)
VALUES ("The Dark Knight", 2008, "PG-13", "Warner Bros.");
INSERT INTO movies (title, year, MPAA_rating, studio)
VALUES ("The Dark Knight Rises", 2012, "PG-13", "Warner Bros.");

-- Insert data into characters table
INSERT INTO characters (char_name, actor_name)
VALUES ("Bruce Wayne", "Christian Bale");
INSERT INTO characters (char_name, actor_name)
VALUES ("Alfred", "Michael Caine");
INSERT INTO characters (char_name, actor_name)
VALUES ("Ra's Al Ghul", "Liam Neeson");
INSERT INTO characters (char_name, actor_name)
VALUES ("Rachel Dawes", "Katie Holmes");
INSERT INTO characters (char_name, actor_name)
VALUES ("Commissioner Gordon", "Gary Oldman");
INSERT INTO characters (char_name, actor_name)
VALUES ("Joker", "Heath Ledger");
INSERT INTO characters (char_name, actor_name)
VALUES ("Harvey Dent", "Aaron Eckhart");
INSERT INTO characters (char_name, actor_name)
VALUES ("Rachel Dawes", "Maggie Gyllenhaal");
INSERT INTO characters (char_name, actor_name)
VALUES ("Bane", "Tom Hardy");
INSERT INTO characters (char_name, actor_name)
VALUES ("John Blake", "Joseph Gordon-Levitt");
INSERT INTO characters (char_name, actor_name)
VALUES ("Selina Kyle", "Anne Hathaway");

-- Insert data into casts table
INSERT INTO casts (char_id, movie_id)
VALUES (1, 1);
INSERT INTO casts (char_id, movie_id)
VALUES (1, 2);
INSERT INTO casts (char_id, movie_id)
VALUES (1, 3);
INSERT INTO casts (char_id, movie_id)
VALUES (2, 1);
INSERT INTO casts (char_id, movie_id)
VALUES (2, 2);
INSERT INTO casts (char_id, movie_id)
VALUES (3, 1);
INSERT INTO casts (char_id, movie_id)
VALUES (4, 1);
INSERT INTO casts (char_id, movie_id)
VALUES (5, 1);
INSERT INTO casts (char_id, movie_id)
VALUES (5, 3);
INSERT INTO casts (char_id, movie_id)
VALUES (6, 2);
INSERT INTO casts (char_id, movie_id)
VALUES (7, 2);
INSERT INTO casts (char_id, movie_id)
VALUES (8, 2);
INSERT INTO casts (char_id, movie_id)
VALUES (9, 3);
INSERT INTO casts (char_id, movie_id)
VALUES (10, 3);
INSERT INTO casts (char_id, movie_id)
VALUES (11, 3);

-- Prints a header for the movies output
.print ""
.print "Movies"
.print "======"
.print ""

-- The SQL statement for the movies output
.width 25
SELECT title, year, MPAA_rating, studio
FROM movies;

-- Prints a header for the cast output
.print ""
.print "Top Cast"
.print "========"
.print ""


-- The SQL statement for the cast output
.width 25 20 30
SELECT movies.title, characters.actor_name, characters.char_name
FROM casts INNER JOIN movies INNER JOIN characters 
ON casts.movie_id = movies.id AND casts.char_id = characters.id
ORDER BY movies.year;

