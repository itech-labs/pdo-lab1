# SQL query for tasks (examples)

### List of films of the selected genre:

```sql
SELECT name, date, country, director, title FROM film
JOIN film_genre ON ID_FILM = FID_Film
JOIN genre ON FID_Genre = ID_Genre
WHERE title = "Action";
```

### List of films with the selected actor:

```sql
SELECT  film.name, film.date, film.country, film.director, GROUP_CONCAT(genre.title) AS genres FROM film
JOIN film_actor ON film.ID_FILM = film_actor.FID_Film
JOIN actor ON film_actor.FID_Actor = actor.ID_Actor
JOIN film_genre ON film.ID_FILM = film_genre.FID_Film
JOIN genre ON film_genre.FID_Genre = genre.ID_Genre
WHERE actor.name = "Oleksiy Hnatkovskyi"
GROUP BY film.ID_FILM;
```

### List of films for the specified time interval:

```sql
SELECT name, date, country, director, GROUP_CONCAT(genre.title) AS genres FROM film
JOIN film_genre ON film.ID_FILM = film_genre.FID_Film
JOIN genre ON genre.ID_Genre = film_genre.FID_Genre
WHERE date BETWEEN "2019-01-09" AND "2024-08-24"
GROUP BY film.ID_FILM;
```
