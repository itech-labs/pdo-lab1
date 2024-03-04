<?php
include("connect.php");

$actor_name = $_GET["actor"];

$SELECT = "SELECT  film.name, film.date, film.country, film.director, GROUP_CONCAT(genre.title) AS genres FROM film
JOIN film_actor ON film.ID_FILM = film_actor.FID_Film
JOIN actor ON film_actor.FID_Actor = actor.ID_Actor
JOIN film_genre ON film.ID_FILM = film_genre.FID_Film
JOIN genre ON film_genre.FID_Genre = genre.ID_Genre 
WHERE actor.name = :actor_name
GROUP BY film.ID_FILM
ORDER BY film.name";

try {
    $stmt = $dbh->prepare($SELECT);
    $stmt->bindValue(":actor_name", $actor_name);
    $stmt->execute();

    $res = $stmt->fetchAll();
} catch (PDOException $ex) {
    echo $ex->GetMessage();
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo($actor_name)?></title>
    <link rel="stylesheet" href="./get_by_genre.css">
</head>
<body>
    <h2>Movies starring <?php echo($actor_name)?></h2>

    <?php
    if (count($res) == 0) {
        echo("<p>No movies found starring $actor_name.</p>");
    } else {
    ?>
        <table>
            <thead>
                <th>Name</th>
                <th>Date</th>
                <th>Country</th>
                <th>Director</th>
                <th>Genre</th>
            </thead>
            <tbody>
                <?php 
                foreach ($res as $row) {
                    echo("<tr><td>$row[0]</td>");
                    echo("<td>$row[1]</td>");
                    echo("<td>$row[2]</td>");
                    echo("<td>$row[3]</td>");
                    echo("<td>$row[4]</td></tr>");
                }
                ?>
            </tbody>
        </table>
    <?php
    }
    $dbh = null;
    ?>
</body>
</html>