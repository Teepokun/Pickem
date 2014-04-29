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

$con=mysqli_connect("127.0.0.1","dlindem3","T@R63dis","dlindem3");

// Check connection
if (mysqli_connect_errno()) {
  echo "Failed to connect to MySQL: " . mysqli_connect_error();
}
else {
	echo "suceess";
}

if($home == "any" && $away == "any") {
	$query = "Select * from game";
}
else if($away == "any") {
	$query = "Select * from game where Home = '" . $home . "'";
}
else if($home == "any") {
	$query = "Select * from game where Away = '" . $away . "'";
}
else {
$query = "Select * from game where Away = '" . $away . "' and Home = '" . $home . "'";
}


if(isset($conference)) {
	$query = $query . " and Conference = '" . $conference . "'";
}
//print($query);

$json = array();
$result = mysqli_query($con, $query); 
while($row = mysqli_fetch_array($result)) {
	$temp = array('home' => $row['Home'],
				  'away' => $row['Away'],
				  'date' => $row['Date'],
				  'odds' => $row['Odds']);
	array_push($json, $temp);
}

print(json_encode($json));

mysqli_close($con);
?> 