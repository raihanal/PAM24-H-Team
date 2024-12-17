<?php
include 'db_config.php';

$child_id = $_POST['child_id'];
$latitude = $_POST['latitude'];
$longitude = $_POST['longitude'];

$sql = "INSERT INTO child_locations (child_id, latitude, longitude, timestamp) VALUES ($child_id, $latitude, $longitude, NOW())";

if ($conn->query($sql) === TRUE) {
    echo json_encode(["status" => "success", "message" => "Lokasi ditambahkan"]);
} else {
    echo json_encode(["status" => "error", "message" => "Gagal menambahkan lokasi"]);
}
?>
