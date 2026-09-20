# MiniMax Proxy para Claude Desktop

**Objetivo:** Usar modelos MiniMax como modelos Anthropic en la UI de Claude Desktop, sin costo de suscripción.

## Modelos Disponibles

| Nombre en Claude Desktop | Modelo MiniMax |
|------------------------|----------------|
| `claude-opus-5` | MiniMax-M3 |
| `claude-sonnet-5` | MiniMax-M2.7-highspeed |
| `claude-haiku-4-5` | MiniMax-M2.7 |

## Requisitos

- Python 3.8+
- pip install litellm
- API key de MiniMax ([obtenerla aquí](https://platform.minimax.io/))

## Instalación

### 1. Instalar litellm

```bash
pip install litellm
```

### 2. Configurar API Key

**Linux/macOS:**
```bash
export MINIMAX_API_KEY="tu-api-key-aqui"
```

**Windows (PowerShell):**
```powershell
$env:MINIMAX_API_KEY = "tu-api-key-aqui"
```

Para persistir la key, agrégala a tu perfil de shell (~/.bashrc, ~/.zshrc) o configura la variable de entorno en tu sistema.

### 3. Configurar Claude Desktop

Abre el archivo de configuración:
- **Windows:** `%APPDATA%\Claude\claude_desktop_config.json`
- **macOS:** `~/Library/Application Support/Claude/claude_desktop_config.json`
- **Linux:** `~/.config/Claude/claude_desktop_config.json`

Agrega estas líneas:

```json
{
  "enableClaudeDesktopAPI": true,
  "apiKeys": {
    "claude": "sk-local-minimax"
  }
}
```

Para usar un modelo específico, selecciónalo en el menú de modelos de Claude Desktop:
- `claude-opus-5` - MiniMax-M3
- `claude-sonnet-5` - MiniMax-M2.7-highspeed
- `claude-haiku-4-5` - MiniMax-M2.7

## Uso

### Windows (PowerShell)
```powershell
.\start-minimax-proxy.ps1
```

### Linux/macOS
```bash
chmod +x start-minimax-proxy.sh
./start-minimax-proxy.sh
```

El proxy estará disponible en `http://localhost:4000`.

## Solución de problemas

### Error: Invalid model name
Verifica que el modelo seleccionado en Claude Desktop sea uno de los listados arriba (deben empezar con `claude-`).

### Error: falta MINIMAX_API_KEY
Asegúrate de tener la variable de entorno configurada antes de ejecutar el script.
