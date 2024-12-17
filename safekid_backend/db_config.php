<?php
$servername = "localhost";
$username = "root"; // Username default XAMPP
$password = "";     // Password default kosong
$dbname = "safekid"; // Nama database Anda

// Membuat koneksi
$conn = new mysqli($servername, $username, $password, $dbname);

// Cek koneksi
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>
