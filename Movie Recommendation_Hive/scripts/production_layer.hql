-- PRODUCTION LAYER

CREATE TABLE movies
(
	id INT,
	title STRING,
	genres ARRAY<STRING>
)
STORED AS ORC;

INSERT INTO movies
SELECT id, title, genres 
FROM movies_trans;


CREATE TABLE movie_ratings
(
	m1_id INT,
	m2_id INT,
	m1_rating DOUBLE,
	m2_rating DOUBLE
)
STORED AS ORC;

INSERT INTO movie_ratings
SELECT m1_id, m2_id, m1_rating, m2_rating from movie_ratings_str;

CREATE TABLE movie_correlation
(
	m1_id INT,
	m2_id INT,
	no_ratings INT,
	correlation DOUBLE
)
STORED AS ORC;

INSERT INTO movie_correlation
SELECT m1_id, m2_id, no_ratings, correlation from movie_correlation_str;