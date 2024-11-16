import matplotlib.pyplot as plt

bad_query_t = 3.7348
good_query_t = 0.2135

tempos = [bad_query_t, good_query_t]
labels = ["Bad Query", "Bem Feita"]

plt.bar(labels, tempos, color=["red", "green"])
plt.ylabel("Execution Time")
plt.title("Execution time of consultation with two queries types")
plt.show()
