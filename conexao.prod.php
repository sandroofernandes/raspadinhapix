<?php

/**
 * Configuração de Banco de Dados - PRODUÇÃO
 * Renomeie este arquivo para conexao.php no servidor
 */

// Configurações do banco de dados
$host = $_ENV['DB_HOST'] ?? 'localhost';
$db   = $_ENV['DB_DATABASE'] ?? 'raspadinhapix';
$user = $_ENV['DB_USERNAME'] ?? 'root';
$pass = $_ENV['DB_PASSWORD'] ?? '';
$charset = 'utf8mb4';

$dsn = "mysql:host=$host;dbname=$db;charset=$charset";
$options = [
  PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
  PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
  PDO::ATTR_EMULATE_PREPARES   => false,
];

try {
  $pdo = new PDO($dsn, $user, $pass, $options);
} catch (\PDOException $e) {
  // Em produção, não expor detalhes do erro
  error_log("Database connection error: " . $e->getMessage());
  throw new \PDOException("Erro de conexão com o banco de dados", (int)$e->getCode());
}

// Configurações do site (buscar do banco ou variáveis de ambiente)
try {
  $site = $pdo->query("SELECT nome_site, logo, deposito_min, saque_min, cpa_padrao, revshare_padrao FROM config LIMIT 1")->fetch(PDO::FETCH_ASSOC);
  $nomeSite = $site['nome_site'] ?? $_ENV['SITE_NAME'] ?? 'RaspaPix';
  $logoSite = $site['logo'] ?? '';
  $depositoMin = $site['deposito_min'] ?? 10;
  $saqueMin = $site['saque_min'] ?? 50;
  $cpaPadrao = $site['cpa_padrao'] ?? 10;
  $revshare_padrao = $site['revshare_padrao'] ?? 10;
} catch (Exception $e) {
  // Valores padrão se não conseguir conectar ao banco
  $nomeSite = $_ENV['SITE_NAME'] ?? 'RaspaPix';
  $logoSite = '';
  $depositoMin = 10;
  $saqueMin = 50;
  $cpaPadrao = 10;
  $revshare_padrao = 10;

  error_log("Config query error: " . $e->getMessage());
}

// URL do site para produção
$urlSite = $_ENV['SITE_URL'] ?? 'https://raspify.com.br';
