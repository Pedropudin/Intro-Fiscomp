import matplotlib.pyplot as plt
import pandas as pd
import numpy as np

#=============== Tarefa A =======================#
print("Plotando Tarefa A")

headers = ["Time","Theta Erro","Omega Erro","Energy Erro","Theta","Omega","Energy"]

df = pd.read_csv("resultA.csv",names=headers)

x = df["Time"].to_numpy()

plt.plot(x,df["Theta Erro"].to_numpy(),label="theta(t) sem correção")
plt.plot(x,df["Theta"].to_numpy(),label="theta(t)")
plt.legend()
plt.savefig("posicao-A.pdf")
plt.clf()
plt.plot(x,df["Energy Erro"].to_numpy(),label="energia(t) sem correção")
plt.plot(x,df["Energy"].to_numpy(),label="energia(t)")
plt.legend()
plt.savefig("energia-A.pdf")

#=============== Tarefa B =======================#

#print("Plotando Tarefa B")
