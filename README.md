# MiniMax Proxy para Claude Desktop

Proxy local que permite usar modelos MiniMax con Claude Desktop mediante litellm.

## Modelos Disponibles

| Nombre en Claude Desktop | Modelo MiniMax | Descripción |
|------------------------|----------------|-------------|
| `claude-sonnet-4-5` | MiniMax-M3 | Modelo principal compatible con Claude |
| `minimax-text-01` | MiniMax-Text-01 | MiniMax Text 2.7 normal |
| `minimax-text-01-highspeed` | MiniMax-Text-01-High | MiniMax Text 2.7 alta velocidad |

## Requisitos

- Python 3.8+
- pip install litellm
- API key de MiniMax ([obtenerla aquí](https://platform.minimax.io/))

## Instalación

### 1. Instalar dependencias

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

Agrega esto en la configuración de Claude Desktop:

```json
{
  "enable Claude Desktop API": true,
  "API keys": {
    "claude": "sk-local-minimax"
  },
  "Autonomous Flight": {
    "custom": {
      "model": "claude-sonnet-4-5"
    }
  }
}
```

Para usar otro modelo, cambia el valor de `model`:
- `minimax-text-01` - MiniMax Text 2.7 normal
- `minimax-text-01-highspeed` - MiniMax Text 2.7 alta velocidad

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

## Configuración avanzada

Edita `config.yaml` para:
- Agregar más modelos
- Cambiar el puerto
- Modificar la master key

## Solución de problemas

### Error: falta MINIMAX_API_KEY
Asegúrate de tener la variable de entorno configurada antes de ejecutar el script.

### Error de certificado SSL
El script automáticamente configura los certificados. Si persiste, verifica que tienes `certifi` instalado:
```bash
pip install certifi
```
