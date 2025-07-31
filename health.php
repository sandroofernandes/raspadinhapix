<?php

/**
 * Health Check Endpoint Simplificado
 * Verifica apenas se PHP está funcionando
 */

header('Content-Type: application/json');

try {
  // Verificar apenas se o PHP está funcionando
  $status = [
    'status' => 'healthy',
    'timestamp' => date('Y-m-d H:i:s'),
    'php_version' => PHP_VERSION,
    'server' => $_SERVER['SERVER_SOFTWARE'] ?? 'Unknown'
  ];

  http_response_code(200);
  echo json_encode($status, JSON_PRETTY_PRINT);
} catch (Exception $e) {
  $error = [
    'status' => 'unhealthy',
    'error' => $e->getMessage(),
    'timestamp' => date('Y-m-d H:i:s')
  ];

  http_response_code(500);
  echo json_encode($error, JSON_PRETTY_PRINT);
}
