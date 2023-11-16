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
#Acho que é interessante plotar só o começo da energia (talvez até o 100)
plt.plot(x,df["Energy Erro"].to_numpy(),label="energia(t) sem correção")
plt.plot(x,df["Energy"].to_numpy(),label="energia(t)")
plt.legend()
plt.savefig("energia-A.pdf")
plt.clf()

#=============== Tarefa B =======================#
print("Plotando Tarefa B1")

headers = ["Theta_0","Simulacao","Integral"]

df = pd.read_csv("resultB1.csv",names=headers)

x = df["Theta_0"].to_numpy()

plt.plot(x,df["Simulacao"].to_numpy(),label="Simulação")
plt.plot(x,df["Integral"].to_numpy(),label="Integral")
plt.legend()
plt.savefig("periodo-B1.pdf")
plt.clf()

print("Plotando Tarefa B2")

headers = ["Theta_0","Simulacao","Integral","Formula"]

df = pd.read_csv("resultB2.csv",names=headers)

x = df["Theta_0"].to_numpy()

plt.plot(x,df["Simulacao"].to_numpy(),label="Simulação")
plt.plot(x,df["Integral"].to_numpy(),label="Integral")
plt.plot(x,df["Formula"].to_numpy(),label="Formula")
plt.legend()
plt.savefig("periodo-B2.pdf")
plt.clf()

print("Plotando Tarefa B3")

headers = ["Tempo","Theta","Omega"]

df = pd.read_csv("resultB3.csv",names=headers)

x = df["Tempo"].to_numpy()

plt.plot(x,df["Theta"].to_numpy(),label="Posição")
plt.savefig("posicao-B3.pdf")
plt.clf()

print("Plotando Tarefa B4")

headers = ["Tempo","theta_0","theta_05","theta_12","omega_0","omega_05","omega_12"]

df = pd.read_csv("resultB4.csv",names=headers)

x = df["Tempo"].to_numpy()

plt.plot(x,df["theta_0"].to_numpy())
plt.savefig("posicao-B4-0.pdf")
plt.clf()
plt.plot(x,df["theta_05"].to_numpy())
plt.savefig("posicao-B4-0_5.pdf")
plt.clf()
plt.plot(x,df["theta_12"].to_numpy())
plt.savefig("posicao-B4-1_2.pdf")
plt.clf()