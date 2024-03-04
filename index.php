<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Film Library</title>
  <link rel="stylesheet" href="./main.css">
</head>
<body>
    <form action="" method="get">
      <div class="form-info">
        <h2>Select movies by genre</h2>
        <label for="genres">Genre</label> <br>
        <select name="genres" id="genres">
          <option value="">--Please choose an option--</option>
        </select>
      </div>
        <input type="submit" value="Submit">
    </form>

    <form action="" method="get">
      <div class="form-info">
        <h2>Select movies by actor</h2>
        <label for="actors">Actor</label> <br>
        <select name="actors" id="actors">
          <option value="">--Please choose an option--</option>
        </select>
      </div>
      <input type="submit" value="Submit">
    </form>

    <form action="" method="get">
      <h2>Select movies by time period</h2>
      <label for="start_date">Start date</label>
      <input type="date" name="start_date" id="start_date"> <br>
      <label for="end_date">End date</label>
      <input type="date" name="end_date" id="end_date">
      <br>
      <input type="submit" value="Submit">
    </form>
</body>
</html>