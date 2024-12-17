<?php
session_start();
if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit;
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Profile Page</title>
</head>
<body>
    <h1>Ini adalah Profil Page</h1>
    <p>Selamat datang di halaman profil.</p>
    <a href="main_page.php">Kembali ke Main Page</a>
</body>
</html>
