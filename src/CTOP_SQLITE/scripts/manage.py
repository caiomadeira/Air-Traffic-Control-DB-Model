import sqlite3
import random
from datetime import datetime, timedelta

# v3 - 100k, v4 - 50k, v5 - 1mi and v5 - 500k

# Conexão com o banco de dados
DB_PATH = "../CTOP_SQLITEV5_1mi.db"
conn = sqlite3.connect(DB_PATH)
cursor = conn.cursor()
print("Iniciando o script...")


def populate_companhiaArea(quantidade):
    # Use um cursor temporário para evitar conflito
    with sqlite3.connect(DB_PATH) as temp_conn:
        temp_cursor = temp_conn.cursor()
        temp_cursor.execute("SELECT codIATA, codICAO FROM CompanhiaAerea")
        existentes = set(temp_cursor.fetchall())  # Converta para um conjunto para busca rápida

    codigos_gerados = set(existentes)  # Inclua os existentes no rastreamento

    while len(codigos_gerados) < quantidade + len(existentes):
        iata = ''.join(random.choices("ABCDEFGHIJKLMNOPQRSTUVWXYZ", k=3))
        icao = ''.join(random.choices("ABCDEFGHIJKLMNOPQRSTUVWXYZ", k=3))
        
        if (iata, icao) in codigos_gerados:
            continue

        codigos_gerados.add((iata, icao))
        
        nome = "Companhia " + ''.join(random.choices("ABCDEFGHIJKLMNOPQRSTUVWXYZ", k=3))
        pais = random.choice(["Brasil", "EUA", "França", "China", "Japão"])
        frota = random.randint(1, 300)
        funcionarios = random.randint(10, 500)
        data_fundacao = datetime(1950, 1, 1) + timedelta(days=random.randint(0, 27000))
        
        yield (iata, icao, nome, pais, frota, funcionarios, data_fundacao.strftime("%Y-%m-%d"))


def massive_insertion(table: str, qtd_registros:int) -> bool:
    if table == 'CompanhiaAerea':
        dados = populate_companhiaArea(qtd_registros)
        cursor.executemany(
            "INSERT OR IGNORE INTO CompanhiaAerea VALUES (?, ?, ?, ?, ?, ?, ?);",
            dados
        )
        conn.commit()
        conn.close()
    return True;

if __name__ == '__main__':
    qtd = 1000000
    y = massive_insertion("CompanhiaAerea", qtd)
    if (y):
        print(f"{qtd} registros inseridos com sucesso!")
    else:
        print("Alguma falha ocorreu.")