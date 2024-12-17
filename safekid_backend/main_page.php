<?php
// main_page.php
session_start();

// Cek apakah user sudah login
if (!isset($_SESSION['user_id'])) {
    header("Location: login.php"); // Redirect ke login jika belum login
    exit;
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Main Page - SafeKid</title>
    <style>
        /* Gaya umum */
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        /* Bagian atas */
        .header {
            text-align: center;
            font-size: 2rem;
            font-weight: bold;
            padding: 20px 0;
            background-color: #4CAF50; /* Warna hijau */
            color: white;
        }

        /* Bagian bawah - Navbar */
        .navbar {
            display: flex;
            justify-content: space-around;
            align-items: center;
            padding: 10px 0;
            background-color: #f1f1f1;
            position: fixed;
            bottom: 0;
            width: 100%;
            border-top: 1px solid #ccc;
        }

        .navbar button {
            background-color: transparent;
            border: none;
            font-size: 1rem;
            cursor: pointer;
        }

        .navbar button:focus {
            outline: none;
        }

        .icon {
            font-size: 1.5rem;
        }

        /* Konten halaman */
        .content {
            flex-grow: 1;
            padding: 20px;
            text-align: center;
            margin-bottom: 60px; /* Agar konten tidak tertutup navbar */
        }
    </style>
</head>
<body>

    <!-- Bagian atas -->
    <div class="header">
        SafeKid
    </div>

    <!-- Konten halaman -->
    <div class="content">
        <h2>Selamat Datang di Halaman Utama SafeKid App</h2>
        <p>Silakan gunakan navigasi di bawah untuk beralih antar halaman.</p>
    </div>

    <!-- Navbar bagian bawah -->
    <div class="navbar">
        <!-- Home Button -->
        <form action="main_page.php" method="get">
            <button type="submit">
                <span class="icon">🏠</span><br>Home
            </button>
        </form>
        <!-- Users Button -->
        <form action="profile_page.php" method="get">
            <button type="submit">
                <span class="icon">👤</span><br>Users
            </button>
        </form>
        <!-- Settings Button -->
        <form action="settings_page.php" method="get">
            <button type="submit">
                <span class="icon">⚙️</span><br>Settings
            </button>
        </form>
    </div>

</body>
</html>
