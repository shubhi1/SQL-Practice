SELECT 
    title, ROUND(AVG(rating), 2) AS avg_rating
FROM
    series
        JOIN
    reviews ON series.id = reviews.series_id
GROUP BY title
ORDER BY avg_rating;

Select * from series;
Select * from reviews;

SELECT 
    first_name, last_name, rating
FROM
    reviewers
        JOIN
    reviews ON reviewers.id = reviews.reviewer_id
ORDER BY first_name,last_name;

SELECT 
    title AS unreviewed_series
FROM
    series
        LEFT JOIN
    reviews ON series.id = reviews.series_id
WHERE
    rating IS NULL;
 --   genre, ROUND(AVG(rating), 2) AS avg_rating
SELECT 
	genre, ROUND(AVG(rating), 5) AS avg_rating
FROM
    series
        JOIN
    reviews ON series.id = reviews.series_id
GROUP BY genre
ORDER BY avg_rating;

SELECT 
    first_name, last_name, COUNT(rating) AS COUNT, 
    IFNULL(MIN(rating),0) AS MIN, IFNULL(MAX(rating),0) AS MAX, 
    IFNULL(ROUND(AVG(rating),2),0)AS AVG, 
    CASE
	WHEN COUNT(rating) = 0 THEN 'INACTIVE'
    ELSE 'ACTIVE' 
END AS status
FROM
    reviewers
      LEFT JOIN
    reviews ON reviewers.id = reviews.reviewer_id
GROUP BY first_name,last_name
ORDER BY first_name,last_name;


SELECT 
    title, rating, CONCAT(first_name, ' ', last_name) AS reviewer
FROM
    reviews
        INNER JOIN
    series ON reviews.series_id = series.id
        INNER JOIN
    reviewers ON reviews.reviewer_id = reviewers.id;

CREATE VIEW full_reviews AS
SELECT title, released_year, genre, rating, first_name, last_name FROM reviews
JOIN series ON series.id = reviews.series_id
JOIN reviewers ON reviewers.id = reviews.reviewer_id;

CREATE VIEW ordered_series AS
SELECT * FROM series ORDER BY released_year;

SELECT * FROM ordered_series;
SELECT * FROM full_reviews;

CREATE OR REPLACE VIEW ordered_series AS
SELECT * FROM series ORDER BY released_year DESC;
 
ALTER VIEW ordered_series AS
SELECT * FROM series ORDER BY released_year;

SELECT 
    title, 
    AVG(rating),
    COUNT(rating) AS review_count
FROM full_reviews 
GROUP BY title HAVING COUNT(rating) > 1;
