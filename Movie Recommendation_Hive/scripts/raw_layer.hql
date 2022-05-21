-- BRONZE/STAGING/RAW LAYER


CREATE TABLE movies_raw
(
	id INT,
	title STRING,
	genres STRING
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
	WITH SERDEPROPERTIES(
		'separationChar' = ',' ,
		'quoteChar' = '"',
		'escapeChar' = '\\')
TBLPROPERTIES('skip.header.line.count' = '1');

LOAD DATA LOCAL
INPATH '../data/movies.csv'
INTO TABLE movies_raw;


CREATE TABLE ratings_raw
(
	user_id INT,
	movie_id INT,
	rating DOUBLE,
	rtime BIGINT
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
STORED AS TEXTFILE
TBLPROPERTIES('skip.header.line.count' = '1');

LOAD DATA LOCAL 
INPATH '../data/ratings.csv'
INTO TABLE ratings_raw;