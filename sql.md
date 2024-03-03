# SQL query for tasks (examples)

### List of films of the selected genre:

```sql
SELECT name, date, country, director FROM film
JOIN film_genre ON ID_FILM = FID_Film
JOIN genre ON FID_Genre = ID_Genre
WHERE title = "Action";
```

### List of films with the selected actor:

```sql
SELECT film.name, film.date, film.country, film.director FROM film
JOIN film_actor ON ID_FILM = FID_Film
JOIN actor ON FID_Actor = ID_Actor
WHERE actor.name = "Oleksiy Hnatkovskyi";
```

### List of films for the specified time interval:

```sql
SELECT name, date, country, director FROM film
WHERE date BETWEEN "2017-11-09" AND "2023-08-24";
```
