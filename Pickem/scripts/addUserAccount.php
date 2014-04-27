<?php

$name=$_POST["name"];
$password=$_POST["password"];
$email=$_POST["email"];

//echo $name . "<br>";
//echo $password . "<br>";
//echo $email . "<br>";

$con=mysqli_connect("127.0.0.1","root","T@R63dis","pickem");

// Check connection
if (mysqli_connect_errno()) {
  echo "Failed to connect to MySQL: " . mysqli_connect_error();
}

$query = "INSERT INTO UserAccount (Name, Password, Email) Values ('" . $name . "', '" . $password . "', '" . $email  . "')";

//echo $query . "<br>";

mysqli_query($con, $query); 

//echo mysqli_error($con) . "<br>";

print(json_encode(mysqli_error($con)));

mysqli_close($con);
?> 