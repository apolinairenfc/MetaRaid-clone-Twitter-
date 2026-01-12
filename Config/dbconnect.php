<?php

$envPath = dirname(__DIR__) . '/.env';
if (file_exists($envPath)) {
    $env = parse_ini_file($envPath, false, INI_SCANNER_RAW);
    if (is_array($env)) {
        foreach ($env as $key => $value) {
            if (getenv($key) === false) {
                putenv($key . '=' . $value);
            }
        }
    }
}

$dbHost = getenv('DB_HOST') ?: 'localhost';
$dbName = getenv('DB_NAME') ?: 'twitter';
$dbUser = getenv('DB_USER') ?: 'root';
$dbPassword = getenv('DB_PASSWORD') ?: '';

try {
    $db = new PDO("mysql:host=$dbHost;dbname=$dbName", $dbUser, $dbPassword, [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION
    ]);
} catch (PDOException $e) {
    error_log("Erreur de connexion : " . $e->getMessage());
    echo "Erreur de connexion à la base de données.";
}
