<?php
header("Content-Type: application/json");
header("Access-Control-Allow-Origin: *");

// Koneksi ke database
$conn = new mysqli("localhost", "username", "password", "nama_database");

if ($conn->connect_error) {
    echo json_encode(["status" => "error", "message" => "Koneksi database gagal"]);
    exit();
}

// Ambil data dari POST
$email = $_POST['email'];
$password = $_POST['password'];

// Query ke database
$query = "SELECT * FROM users WHERE email='$email' AND password='$password'";
$result = $conn->query($query);

if ($result->num_rows > 0) {
    echo json_encode(["status" => "success", "message" => "Login berhasil"]);
} else {
    echo json_encode(["status" => "error", "message" => "Email atau password salah"]);
}

$conn->close();
exit();
?>
