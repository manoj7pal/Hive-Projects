
-- find similar movies, for movie id =260

SELECT * 
FROM movie_correlation mc
WHERE ( m1_.id = 260 or m2_.id = 260)
and correlation > 0.5;
