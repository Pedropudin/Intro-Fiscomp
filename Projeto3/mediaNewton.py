import pandas as pd

data = pd.read_csv("res-secante.txt")

data = data["it"]
a = data.values.tolist()

print(sum(a)/len(a))

