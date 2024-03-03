# SQL query for tasks (examples)

### List of films of the selected genre:

```sql
SELECT name FROM film
JOIN film_genre ON ID_FILM = FID_Film
JOIN genre ON FID_Genre = ID_Genre
WHERE title = "Action";
```

### List of films with the selected actor:

```sql
SELECT film.name FROM film
JOIN film_actor ON ID_FILM = FID_Film
JOIN actor ON FID_Actor = ID_Actor
WHERE actor.name = "Oleksiy Hnatkovskyi";
```

### List of films for the specified time interval:

```sql
SELECT name FROM film
WHERE date BETWEEN "2009-12-18" AND "2015-06-12";
```
