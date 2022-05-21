-- STAR LAYER

CREATE TABLE movie_ratings_str
(
	m1_id INT,
	m2_id INT,
	m1_rating DOUBLE,
	m2_rating DOUBLE
)
STORED AS ORC;

INSERT INTO movie_ratings_str
SELECT r1.movie_id, r2.movie_id, r1.rating, r2.rating
FROM ratings r1, ratings r2
WHERE r1.movie_id < r2.movie_id;

CREATE TABLE movie_correlation_str
(
	m1_id INT,
	m2_id INT,
	no_ratings INT,
	correlation DOUBLE
)
STORED AS ORC;

INSERT INTO movie_correlation_str 
SELECT m1_id, m2_id, count(m1_id), corr(m1_rating, m2_rating)
from movie_ratings_str
group by m1_id, m2_id;