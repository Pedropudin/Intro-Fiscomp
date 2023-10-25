#Programa python utilizado para plotar os gráficos

#========Importações==========#
import pandas as pd
import matplotlib.pyplot as plt
import numpy as np

#========Leitura dos dados=======#
data = pd.read_csv("graph1.csv")
x = data['n'].values

#========Plotagem de cada um dos gráficos=========#
#Derivada Primeira Simétrica de 3 pontos
y = data['simetrica3'].values
plt.semilogx(x,y)
plt.axis([max(x), min(x), min(y), max(y)])
plt.xlabel("h")
plt.ylabel("Erro")
plt.title("Derivada Primeira Simétrica de 3 pontos")
plt.savefig("simetrica-3.pdf")
plt.clf()

#Derivada Primeira para frente de 2 pontos
y = data['frente2'].values
plt.semilogx(x,y,label="Frente de 2 pontos")
plt.axis([max(x), min(x), min(y), max(y)])
plt.xlabel("h")
plt.ylabel("Erro")
plt.title("Derivada Primeira para frente de 2 pontos")
plt.savefig("frente-2.pdf")
plt.clf()

#Derivada Primeira para traz de 2 pontos
y = data['traz2'].values
plt.semilogx(x,y,label="Atraz de 2 pontos")
plt.axis([max(x), min(x), min(y), max(y)])
plt.xlabel("h")
plt.ylabel("Erro")
plt.title("Derivada Primeira para traz de 2 pontos")
plt.savefig("traz-2.pdf")
plt.clf()

#Derivada Primeira Simétrica de 5 pontos
y = data['simetrica5'].values
plt.semilogx(x,y,label="Simétrica de 5 pontos")
plt.axis([max(x), min(x), min(y), max(y)])
plt.xlabel("h")
plt.ylabel("Erro")
plt.title("Derivada Primeira Simétrica de 5 pontos")
plt.savefig("simetrica-5.pdf")
plt.clf()

#Derivada Segunda simétrica de 5 pontos
y = data['d2simetrica5'].values
plt.semilogx(x,y,label="Derivada segunda simétrica de 5 pontos")
plt.axis([max(x), min(x), min(y)/10000, -min(y)/10000])
plt.xlabel("h")
plt.ylabel("Erro")
plt.title("Derivada Segunda simétrica de 5 pontos")
plt.savefig("segunda-simetrica-5.pdf")
plt.clf()

#Derivada Terceira Anti-Simétrica de 5 pontos
y = data['d3anti5'].values
plt.semilogx(x[:-1:],y[:-1:],label="Derivada terceira anti-simétrica de 5 pontos")
plt.axis([max(x), min(x), min(y)/1e20, -min(y)/1e20])
plt.xlabel("h")
plt.ylabel("Erro")
plt.title("Derivada Terceira Anti-Simétrica de 5 pontos")
plt.savefig("terceira-antisimetrica-5.pdf")
plt.clf()