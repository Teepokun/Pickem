<?php
header('Content-type: application/json');
if(isset($_POST["name"])) {
	$name = $_POST["name"];
}
else {
	print($name . "<br>");
	exit(99);
}

if(isset($_POST["conference"])) {
	$conference = $_POST["conference"];
}
else {
	$conference="null";
}

$con=mysqli_connect("127.0.0.1","root","T@R63dis","pickem");

// Check connection
if (mysqli_connect_errno()) {
  echo "Failed to connect to MySQL: " . mysqli_connect_error();
}

if($name == "any") {
	$query = "Select * from team";
}
else {
	if($conference == "null") {
		$query = "Select * from team where name = '" . $name . "'";
	}
	else {
		$query = "Select * from team where name = '" . $name . "' and conference = '" . $conference . "'";
	}
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