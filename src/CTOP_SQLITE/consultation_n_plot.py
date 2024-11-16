import sqlite3
import time
import matplotlib.pyplot as plt

# Função para medir o tempo de execução de uma consulta
def executar_query(db_path, query):
    conn = sqlite3.connect(db_path)
    start_time = time.time()
    cursor = conn.cursor()
    cursor.execute(query)
    conn.commit()
    end_time = time.time()
    conn.close()
    return end_time - start_time

# Lista de bancos de dados e seus respectivos números de registros (deduzidos pelos nomes dos arquivos)
db_info = [
    ("CTOP_SQLITEV2.db", 200_000),
    ("CTOP_SQLITEV3.db", 100_000),
    ("CTOP_SQLITEV4_50k.db", 50_000),
    ("CTOP_SQLITEV5_500k.db", 500_000),
    ("CTOP_SQLITEV5_1mi.db", 1_000_000),
]

# Consultas para teste
query_mal_feita = "SELECT * FROM CompanhiaAerea WHERE nome LIKE '%Companhia%';"
query_bem_feita = "SELECT codIATA, codICAO FROM CompanhiaAerea WHERE nome LIKE 'Companhia A%';"

# Inicializando listas para armazenar os tempos
quantidades = []
tempos_query_mal_feita = []
tempos_query_bem_feita = []

# Iterar sobre cada banco de dados
for db_path, quantidade in db_info:
    print(f"Testando banco de dados: {db_path} com {quantidade} registros...")
    # Registrar número de registros
    quantidades.append(quantidade)

    # Medir tempo da query mal feita
    tempo_mal_feita = executar_query(db_path, query_mal_feita)
    tempos_query_mal_feita.append(tempo_mal_feita)

    # Medir tempo da query bem feita
    tempo_bem_feita = executar_query(db_path, query_bem_feita)
    tempos_query_bem_feita.append(tempo_bem_feita)

# Plotando o gráfico
plt.plot(quantidades, tempos_query_mal_feita, label="Query Mal Feita", marker='o')
plt.plot(quantidades, tempos_query_bem_feita, label="Query Bem Feita", marker='o')
plt.xlabel("Número de Registros no Banco")
plt.ylabel("Tempo de Execução (segundos)")
plt.title("Tempo de Execução de Consultas para Diferentes Bancos de Dados")
plt.legend()
plt.grid(True)
plt.show()
