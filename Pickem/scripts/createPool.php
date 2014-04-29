<?php
header('Content-type: application/json');

if(isset($_POST["name"])) {
	$name = $_POST["name"];
}

if(isset($_POST["conference"])) {
	$conference = $_POST["conference"];
}

if(isset($_POST["commissioner"])) {
	$commissioner = $_POST["commissioner"];
}

if(isset($_POST["deadline"])) {
	$deadline = $_POST["deadline"];
}

if(isset($_POST["password"])) {
	$password = $_POST["password"];
}
else {
	$password = "";
}


$con = mysqli_connect("127.0.0.1","dlindem3","T@R63dis","dlindem3");

// Check connection
if (mysqli_connect_errno()) {
  echo "Failed to connect to MySQL: " . mysqli_connect_error();
}
$base = "insert into pool ";
$field = "(conference, commissioner, deadline, password, name) ";
$values = "values('" . $conference . "', '" . $commissioner . "', now(), '" . $password . "', '" . $name . "')";
$query =  $base . $field . $values;
//echo $query;

$result = mysqli_query($con, $query); 

print(json_encode($json));

mysqli_close($con);
?> 
