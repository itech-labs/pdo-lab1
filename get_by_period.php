<?php
include("connect.php");

$start_date = $_GET["start_date"];
$end_date = $_GET["end_date"];

if($start_date > $end_date){
    header("Location: " . $_SERVER["HTTP_REFERER"]);
    exit();
}

$SELECT = "SELECT name, date, country, director, GROUP_CONCAT(genre.title) AS genres FROM film
JOIN film_genre ON film.ID_FILM = film_genre.FID_Film
JOIN genre ON genre.ID_Genre = film_genre.FID_Genre
WHERE date BETWEEN :start_date AND :end_date
GROUP BY film.ID_FILM";

try {
    $stmt = $dbh->prepare($SELECT);
    $stmt->bindValue(":start_date", $start_date);
    $stmt->bindValue(":end_date", $end_date);
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
    <title>Period</title>
    <link rel="stylesheet" href="./get_by_genre.css">
</head>
<body>
    <h2>Films in the period from <?php echo("$start_date to $end_date")?> </h2>

    <?php
    if (count($res) == 0) {
        echo("<p>No movies found between $start_date and $end_date.</p>");
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