-- SILVER/ENHANCED/TRANSFORMED LAYER


CREATE TABLE movies_trans
(
	id INT,
	title STRING,
	genres ARRAY<STRING>
)
STORED AS ORC;

INSERT INTO movies_trans
SELECT id, title, SPLIT(genres, '\\|') genres 
FROM movies_raw;

CREATE TABLE ratings_trans
(
	user_id INT,
	movie_id INT,
	rating DOUBLE,
	rtime BIGINT
)
STORED AS ORC;

INSERT INTO ratings_trans
SELECT r.user_id, m.id, r.rating, r.rtime
FROM ratings_raw r, movies_trans m
where r.movie_id = m.id;

