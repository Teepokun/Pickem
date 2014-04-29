<?php
header('Content-type: application/json');


if(isset($_POST["name"])) {
	$name = $_POST["name"];
}

$con = mysqli_connect("127.0.0.1","dlindem3","T@R63dis","dlindem3");

// Check connection
if (mysqli_connect_errno()) {
  echo "Failed to connect to MySQL: " . mysqli_connect_error();
}

$query =  "select count(*) as num from pool where name = '" . $name . "'";

$result = mysqli_query($con, $query); 

$row = mysqli_fetch_array($result);
$json = array('num' => $row['num']);

print(json_encode($json));

mysqli_close($con);
?> 