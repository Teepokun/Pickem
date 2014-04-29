<?php
header('Content-type: application/json');


$width = array('width' => array('max' => '640'));
$height = array('height' => array('max' => '480'));

$mandatory = array($width, $height);
$final = array('mandatory' => $mandatory);

print(json_encode($final));
?>