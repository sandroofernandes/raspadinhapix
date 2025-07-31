<?php

/**
 * Página de Teste Simples
 * Para verificar se o Apache e PHP estão funcionando
 */
?>
<!DOCTYPE html>
<html>

<head>
  <title>Teste - Raspadinha PIX</title>
  <meta charset="UTF-8">
</head>

<body>
  <h1>🚀 Aplicação Funcionando!</h1>
  <p><strong>Data/Hora:</strong> <?= date('d/m/Y H:i:s') ?></p>
  <p><strong>PHP Version:</strong> <?= PHP_VERSION ?></p>
  <p><strong>Server:</strong> <?= $_SERVER['SERVER_SOFTWARE'] ?? 'Desconhecido' ?></p>

  <h2>Teste de Extensões PHP:</h2>
  <ul>
    <li>PDO: <?= extension_loaded('pdo') ? '✅ OK' : '❌ Não carregado' ?></li>
    <li>MySQLi: <?= extension_loaded('mysqli') ? '✅ OK' : '❌ Não carregado' ?></li>
    <li>GD: <?= extension_loaded('gd') ? '✅ OK' : '❌ Não carregado' ?></li>
    <li>ZIP: <?= extension_loaded('zip') ? '✅ OK' : '❌ Não carregado' ?></li>
    <li>INTL: <?= extension_loaded('intl') ? '✅ OK' : '❌ Não carregado' ?></li>
  </ul>

  <h2>Arquivos de Configuração:</h2>
  <ul>
    <li>conexao.php: <?= file_exists('conexao.php') ? '✅ Existe' : '❌ Não encontrado' ?></li>
    <li>conexao.prod.php: <?= file_exists('conexao.prod.php') ? '✅ Existe' : '❌ Não encontrado' ?></li>
  </ul>

  <h2>Permissões de Pastas:</h2>
  <ul>
    <li>logs/: <?= is_writable('logs') ? '✅ Escribível' : (is_dir('logs') ? '⚠️ Existe mas não escribível' : '❌ Não existe') ?></li>
    <li>assets/upload/: <?= is_writable('assets/upload') ? '✅ Escribível' : (is_dir('assets/upload') ? '⚠️ Existe mas não escribível' : '❌ Não existe') ?></li>
  </ul>

  <hr>
  <p><strong>Status:</strong> <span style="color: green;">Sistema operacional!</span></p>
</body>

</html>