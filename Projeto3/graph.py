import pandas as pd
import matplotlib.pyplot as plt
import numpy as np

data = pd.read_csv("graph1.csv")

x = data['n'].values

y = data['simetrica3'].values
plt.semilogx(x,y,label="Simétrica 3 pontos")
plt.axis([max(x), min(x), min(y), max(y)])
plt.savefig("simetrica-3.pdf")
plt.clf()
y = data['frente2'].values
plt.semilogx(x,y,label="Frente de 2 pontos")
plt.axis([max(x), min(x), min(y), max(y)])
plt.savefig("frente-2.pdf")
plt.clf()
y = data['traz2'].values
plt.semilogx(x,y,label="Atraz de 2 pontos")
plt.axis([max(x), min(x), min(y), max(y)])
plt.savefig("traz-2.pdf")
plt.clf()
y = data['simetrica5'].values
plt.semilogx(x,y,label="Simétrica de 5 pontos")
plt.axis([max(x), min(x), min(y), max(y)])
plt.savefig("simetrica-5.pdf")
plt.clf()
y = data['d2simetrica5'].values
plt.semilogx(x,y,label="Derivada segunda simétrica de 5 pontos")
plt.axis([max(x), min(x), min(y), -min(y)])
plt.savefig("segunda-simetrica-5.pdf")
plt.clf()
y = data['d3anti5'].values
plt.semilogx(x[:-1:],y[:-1:],label="Derivada terceira anti-simétrica de 5 pontos")
plt.axis([max(x), min(x), min(y), -min(y)])
plt.savefig("terceira-antisimetrica-5.pdf")
plt.clf()

#n,simetrica3,frente2,traz2,simetrica5,d2simetrica5,d3anti5