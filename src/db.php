<?php
session_start();

$conn = mysqli_connect(
  $_ENV['DB_HOST'],
  $_ENV['DB_USER'],
  $_ENV['DB_PASSWORD'],
  $_ENV['DB_NAME']
) or die(mysqli_erro($mysqli));

?>
