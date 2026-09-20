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

### 3. Activar el proxy

Ejecuta el script correspondiente a tu sistema operativo.

**Windows (PowerShell):**
```powershell
.\start-minimax-proxy.ps1
```

**Linux/macOS:**
```bash
chmod +x start-minimax-proxy.sh
./start-minimax-proxy.sh
```

El proxy estará disponible en `http://localhost:4000`.

### 4. Configurar Claude Desktop

1. Activa el **Modo Desarrollador** en Claude Desktop
2. Ve a **Proveedores de terceros**
3. Activa la opción **Gateway**
4. Configura:
   - **Base URL:** `http://localhost:4000`
   - **API Key:** `sk-local-minimax`

5. Selecciona el modelo deseado en el menú de Claude Desktop:
   - `claude-opus-5` - MiniMax-M3
   - `claude-sonnet-5` - MiniMax-M2.7-highspeed
   - `claude-haiku-4-5` - MiniMax-M2.7

## Solución de problemas

### Error de conexión
Verifica que el proxy esté corriendo (`http://localhost:4000`).

### Error: Invalid model name
Verifica que el modelo seleccionado en Claude Desktop sea uno de los listados arriba.

### Error: falta MINIMAX_API_KEY
Asegúrate de tener la variable de entorno configurada antes de ejecutar el script.
