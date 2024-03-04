<?php
include("connect.php");

$genre_title = $_GET["genre"];

$SELECT = "SELECT name, date, country, director, title FROM film
JOIN film_genre ON ID_FILM = FID_Film
JOIN genre ON FID_Genre = ID_Genre
WHERE title = :genre_title
ORDER BY name";

try {
    $stmt = $dbh->prepare($SELECT);
    $stmt->bindValue(":genre_title", $genre_title);
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
    <title><?php echo($genre_title)?></title>
    <link rel="stylesheet" href="./get_by_genre.css">
</head>
<body>
    <h2>Movies of the <?php echo($genre_title)?> genre</h2>

    <?php
    if (count($res) == 0) {
        echo("<p>No movies found for the $genre_title genre.</p>");
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