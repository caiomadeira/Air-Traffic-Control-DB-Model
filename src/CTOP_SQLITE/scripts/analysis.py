import sqlite3
import time

def executar_query(db_path, query):
    conn = sqlite3.connect(db_path) # aqui estou me conectando c o banco
    cursor = conn.cursor() # inicializando o cursor (pode ignorar)
    inicio = time.perf_counter() # seto o inicio da contagem
    cursor.execute(query) # executo uma unica insturcao
    cursor.fetchall() # aqui estou buscando todos os resultados
    fim = time.perf_counter() # fim da contagem
    conn.close()
    return fim - inicio # retorno o calculo do tempo

if __name__ == "__main__":
    db_path = "../CTOP_SQLITEV5_1mi.db"

    # Query para criar o índice (executar apenas uma vez)
    criar_indice = "CREATE INDEX IF NOT EXISTS idx_nome ON CompanhiaAerea(nome);"
    
    # Query para medir o desempenho
    query_mal_feita = "SELECT * FROM CompanhiaAerea WHERE nome LIKE '%Companhia%';"
    query_bem_feita = "SELECT codIATA, codICAO FROM CompanhiaAerea WHERE nome LIKE 'Companhia A%';"

    # Criação do índice
    conn = sqlite3.connect(db_path)
    cursor = conn.cursor()
    cursor.execute(criar_indice)
    conn.commit()
    conn.close()

    # Medir o tempo das consultas
    tempo_mal_feita = executar_query(db_path, query_mal_feita)
    tempo_bem_feita = executar_query(db_path, query_bem_feita)

    print(f"Tempo Query Mal Feita: {tempo_mal_feita:.4f}s")
    print(f"Tempo Query Bem Feita: {tempo_bem_feita:.4f}s")