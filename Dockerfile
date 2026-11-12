# 1. Imagen base oficial de Python 3.12 liviana
FROM python:3.12-slim

# 2. Definir /app como directorio de trabajo dentro del contenedor
WORKDIR /app

# 3. Copiar dependencias e instalarlas sin guardar caché (optimiza tamaño y velocidad)
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 4. Copiar únicamente las carpetas necesarias para ejecutar el servicio
COPY app/ app/
COPY frontend/ frontend/
COPY models/ models/

# 5. Exponer el puerto 8000
EXPOSE 8000

# 6. Comando de arranque (0.0.0.0 permite recibir tráfico externo al contenedor)
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]