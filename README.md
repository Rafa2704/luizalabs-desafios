# Desafios LuizaLabs

Este repositório contém as soluções dos desafios técnicos propostos, divididos em três partes:  
**Desafio 1 (Spark)**, **Desafio 2 (PostgreSQL)** e **Desafio 3 (Python puro)**.

---

## 🚀 Desafio 1 — PySpark com Jupyter Notebook

A solução do Desafio 1 (partes 1.1 e 1.2) foi implementada usando **PySpark** dentro de um **Jupyter Notebook**, utilizando um container Docker para o ambiente de execução.

### ✅ Como executar

> A imagem usada está definida no arquivo `docker-compose.yml`, incluído neste repositório.  
> As pastas de dados e notebooks já estão mapeadas automaticamente para dentro do container.

1. Na raiz do projeto, abra o terminal e execute:

   ```bash
   docker compose up -d
   ```

2. Após a inicialização, abra o navegador e acesse:

   [http://localhost:8888/?token=magalu](http://localhost:8888/?token=magalu)

3. O Jupyter Notebook será iniciado com a pasta `notebooks` já carregada.  
   Basta abrir o notebook `Solucao1.ipynb`, que já está preenchido com todo o código da solução, pronto para ser executado célula por célula.

---

## 🗄️ Desafio 2 — PostgreSQL com Docker

A solução do Desafio 2 foi implementada utilizando um banco **PostgreSQL**, simulado localmente via Docker, com comandos **SQL** para resolver as consultas.

### ✅ Como executar

> Um container Docker com PostgreSQL é usado para simular o banco de dados.

1. Com o Docker em execução, rode o seguinte comando no terminal para subir o container:

   ```bash
   docker run --name desafio2_postgres \
     -e POSTGRES_USER=admin \
     -e POSTGRES_PASSWORD=admin \
     -e POSTGRES_DB=desafio2db \
     -p 5432:5432 -d postgres:14
   ```

2. Conecte-se ao banco `desafio2db` usando o cliente SQL de sua preferência (ex: extensão do VSCode, DBeaver, psql etc).

3. A query de solução está salva no arquivo:

   ```
   desafio2/desafio2_postgres.session.sql
   ```

---

## 🐍 Desafio 3 — Python puro com Jupyter Notebook

A solução do Desafio 3 foi feita inteiramente em **Python**, utilizando o **Jupyter Notebook** instalado localmente.

### ✅ Como executar

1. Certifique-se de ter **Python 3** e **Jupyter Notebook** instalados em sua máquina.

2. Abra o notebook de solução localizado em:

   ```
   desafio3/solucao4.ipynb
   ```

3. Execute as células sequencialmente. O notebook:

   - Lê os dados de transações do arquivo `dados/json_transacoes_contas.txt`;
   - Calcula os saldos diários com rendimento de 0,015%;
   - Gera o arquivo final `desafio3.csv` com os saldos corrigidos;
   - Exibe visualizações gráficas complementares com uso de `pandas` e `plotly`.

4. Gráficos adicionais também podem ser acessados no notebook:

   ```
graficos.ipynb   ```

---

📁 **Estrutura de Pastas**
```
.
├── dados/                  # Arquivos de entrada e saída (CSV, JSON)
├── desafio2/               # Scripts e queries SQL do desafio 2
├── desafio3/               # Notebook e saída CSV do desafio 3
├── notebooks/              # Jupyter notebook com as soluções do desafio 1 e gráficos
├── docker-compose.yml      # Configuração Docker para ambiente Spark + Jupyter
├── como_rodar.txt          # Instruções de execução simplificadas
└── README.md               # Este arquivo
```

---

💡 Sinta-se à vontade para explorar, rodar os notebooks e analisar os resultados.
