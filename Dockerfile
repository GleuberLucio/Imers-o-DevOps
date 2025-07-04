FROM python:3.13.5-alpine3.22

# Define o diretório de trabalho no contêiner
WORKDIR /app

# Copia o arquivo de dependências e instala as dependências
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copia o código da aplicação para o contêiner
COPY . .

# Expõe a porta em que o aplicativo é executado (o padrão do FastAPI é 8000)
EXPOSE 8000

# Comando para executar a aplicação
# O uso de host='0.0.0.0' torna o servidor acessível externamente
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]

