<?php
header('Content-type: application/json');
if(isset($_POST["home"])) {
	$home = $_POST["home"];
}

if(isset($_POST["away"])) {
	$away = $_POST["away"];
}

if(isset($_POST["conference"])) {
	$conference = $_POST["conference"];
}

$con=mysqli_connect("127.0.0.1","root","T@R63dis","pickem");

// Check connection
if (mysqli_connect_errno()) {
  echo "Failed to connect to MySQL: " . mysqli_connect_error();
}


if($home == "any" && $away == "any") {
	$query = "Select * from game";
}
else if($away == "any") {
	$query = "Select * from game where home = '" . $home . "'";
}
else if($home == "any") {
	$query = "Select * from game where away = '" . $away . "'";
}
else {
$query = "Select * from game where away = '" . $away . "' and home = '" . $home . "'"/;
}

if($conference != null) {
	$query = $query . " and conference = '" . $conference . "'";
}

$json = array();
$result = mysqli_query($con, $query); 
while($row = mysqli_fetch_array($result)) {
	$temp = array('name' => $row['Name'],
				  'conference' => $row['Conference'],
				  'record' => $row['Record'],
				  'logo' => $row['Logo']);
	array_push($json, $temp);
}

print(json_encode($json));

mysqli_close($con);
?> 