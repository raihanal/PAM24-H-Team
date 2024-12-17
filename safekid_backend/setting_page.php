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
    <title>Settings Page</title>
</head>
<body>
    <h1>Ini adalah Settings Page</h1>
    <p>Atur aplikasi Anda di sini.</p>
    <a href="main_page.php">Kembali ke Main Page</a>
</body>
</html>
