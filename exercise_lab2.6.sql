USE sakila;
-- 1. In the table actor, which are the actors whose last names are not repeated? For example if you would sort the data in the table actor by last_name, 
-- you would see that there is Christian Arkoyd, Kirsten Arkoyd, and Debbie Arkoyd. These three actors have the same last name. So we do not want to include 
-- this last name in our output. Last name "Astaire" is present only one time with actor "Angelina Astaire", hence we would want this in our output list.
SELECT *,count(first_name) AS repeats 
FROM sakila.actor
GROUP BY last_name
HAVING repeats = 1;

-- 2. Which last names appear more than once? We would use the same logic as in the previous question but this time we want to include the last names of the 
-- actors where the last name was present more than once
SELECT *,count(first_name) AS repeats 
FROM sakila.actor
GROUP BY last_name
HAVING repeats > 1; -- Done

-- 3. Using the rental table, find out how many rentals were processed by each employee.
SELECT *,count(rental_id) AS num_of_rentals FROM rental
GROUP BY staff_id; -- Done

-- 4. Using the film table, find out how many films were released each year.
SELECT release_year, count(film_id) AS films_per_year FROM film
GROUP BY release_year; -- 1000

-- 5. Using the film table, find out for each rating how many films were there.
SELECT rating, count(film_id) AS films_rated FROM film
GROUP BY rating; -- Done

-- 7. What is the mean length of the film for each rating type. Round off the average lengths to two decimal places
SELECT * FROM film;
SELECT rating, count(film_id) AS films_rated, ROUND(AVG(length),2) AS rounded_avg_length FROM film
GROUP BY rating; -- Done

-- 8. Which kind of movies (rating) have a mean duration of more than two hours?
SELECT * FROM film;
SELECT rating, count(film_id) AS films_rated, ROUND(AVG(length),2) AS rounded_avg_length FROM film
GROUP BY rating
HAVING rounded_avg_length > 120; -- Done

-- 9. Rank films by length (filter out the rows that have nulls or 0s in length column). In your output, only select the columns title, length, and the rank.
SELECT title, length FROM film
WHERE length != 0 AND length != ' '
ORDER BY length; -- Done

-- SELECT title, length,
-- CASE
--     WHEN length > (max(length)-min(length))*2/3 THEN "Long movie"
--     WHEN length BETWEEN (max(length)-min(length))*1/3 AND (max(length)-min(length))*2/3 THEN "Normal length"
--     WHEN length < (max(length)-min(length))*1/3 THEN "Short movie"
--     ELSE "NA"
-- END AS rank_ 
-- FROM film; -- WHY IS THIS NOT WORKING


