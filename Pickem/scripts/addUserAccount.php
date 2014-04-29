<?php

$name=$_POST["name"];
$password=$_POST["password"];
$email=$_POST["email"];
$firstname=$_POST["firstname"];
$lastname=$_POST["lastname"];

//echo $name . "<br>";
//echo $password . "<br>";
//echo $email . "<br>";

$con=mysqli_connect("127.0.0.1","dlindem3","T@R63dis","dlindem3");

// Check connection
if (mysqli_connect_errno()) {
  echo "Failed to connect to MySQL: " . mysqli_connect_error();
}

$query = "INSERT INTO useraccount (Name, Password, Email, Firstname, Lastname) Values ('" . $name . "', '" . $password . "', '" . $email  . "', '" . $firstname . "', '" . $lastname ."')";
print($query);
//echo $query . "<br>";

mysqli_query($con, $query); 

//echo mysqli_error($con) . "<br>";

print(json_encode(mysqli_error($con)));

mysqli_close($con);
?> 