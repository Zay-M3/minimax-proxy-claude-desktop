# Lanzador del proxy MiniMax para Claude Desktop
$ErrorActionPreference = "Stop"
Set-Location $PSScriptRoot

if ([string]::IsNullOrWhiteSpace($env:MINIMAX_API_KEY)) {
  Write-Host 'ERROR: falta MINIMAX_API_KEY.' -ForegroundColor Red
  Write-Host 'Corre esto en PowerShell y abri una terminal NUEVA:' -ForegroundColor Yellow
  Write-Host '  setx MINIMAX_API_KEY "tu-api-key-de-minimax"' -ForegroundColor Yellow
  exit 1
}

# Arregla el CA bundle (hay una ruta rota de PostgreSQL en el entorno del sistema)
$ca = python -c "import certifi; print(certifi.where())"
$env:SSL_CERT_FILE      = $ca
$env:REQUESTS_CA_BUNDLE = $ca
$env:CURL_CA_BUNDLE     = $ca

# litellm.exe se instalo en el user scripts dir, que no esta en PATH
$scripts = python -c "import sysconfig; print(sysconfig.get_path('scripts','nt_user'))"
$env:PATH = "$scripts;$env:PATH"

Write-Host "Levantando proxy MiniMax en http://localhost:4000 ..." -ForegroundColor Green
litellm --config config.yaml --port 4000
