import matplotlib.pyplot as plt
import pandas as pd
import numpy as np

#=============== Tarefa A =======================#
def A():
    print("Plotando Tarefa A")

    headers = ["Time","Theta Erro","Omega Erro","Energy Erro","Theta","Omega","Energy"]

    df = pd.read_csv("saida-A-13696213.csv",names=headers)

    x = df["Time"].to_numpy()

    plt.plot(x,df["Theta Erro"].to_numpy(),label="Método de Euler")
    plt.plot(x,df["Theta"].to_numpy(),label="Método de Euler-Cromer")
    plt.legend()
    plt.xlabel("Tempo")
    plt.ylabel("Theta")
    #plt.savefig("./tarefa-A/tarefa-A-graf-posicao-13696213.pdf")
    plt.savefig("./tarefa-A/tarefa-A-graf-posicao-13696213.png")
    plt.clf()

    plt.plot(x[:10_000],df["Energy Erro"].to_numpy()[:10_000],label="Método de Euler")
    plt.plot(x[:10_000],df["Energy"].to_numpy()[:10_000],label="Método de Euler-Cromer")
    plt.legend()
    plt.xlabel("Tempo")
    plt.ylabel("Energia")
    #plt.savefig("./tarefa-A/tarefa-A-graf-energia-13696213.pdf")
    plt.savefig("./tarefa-A/tarefa-A-graf-energia-13696213.png")
    plt.clf()

#=============== Tarefa B =======================#
def B():
    print("Plotando Tarefa B1")

    headers = ["Theta_0","Simulacao","Integral"]

    df = pd.read_csv("saida-B1-13696213.csv",names=headers)

    x = df["Theta_0"].to_numpy()

    plt.plot(x,df["Simulacao"].to_numpy(),label="Simulação")
    plt.plot(x,df["Integral"].to_numpy(),label="Integral")
    plt.legend()
    plt.xlabel("Theta")
    plt.ylabel("Período")
    #plt.savefig("./tarefa-B/tarefa-B1-graf-periodo-13696213.pdf")
    plt.savefig("./tarefa-B/tarefa-B1-graf-periodo-13696213.png")
    plt.clf()

    print("Plotando Tarefa B2")

    headers = ["Theta_0","Simulacao","Integral","Formula"]

    df = pd.read_csv("saida-B2-13696213.csv",names=headers)

    x = df["Theta_0"].to_numpy()

    plt.plot(x,df["Simulacao"].to_numpy(),label="Simulação")
    plt.plot(x,df["Integral"].to_numpy(),label="Integral")
    plt.plot(x,df["Formula"].to_numpy(),label="Aproximação Analítica")
    plt.legend()
    plt.xlabel("Theta")
    plt.ylabel("Período")
    #plt.savefig("./tarefa-B/tarefa-B2-graf-periodo-13696213.pdf")
    plt.savefig("./tarefa-B/tarefa-B2-graf-periodo-13696213.png")
    plt.clf()

    print("Plotando Tarefa B3")

    headers = ["Tempo","Theta","Omega"]

    df = pd.read_csv("saida-B3-13696213.csv",names=headers)

    x = df["Tempo"].to_numpy()

    plt.plot(x,df["Theta"].to_numpy(),label="Posição")
    plt.xlabel("Tempo")
    plt.ylabel("Theta")
    #plt.savefig("./tarefa-B/tarefa-B3-graf-posicao-13696213.pdf")
    plt.savefig("./tarefa-B/tarefa-B3-graf-posicao-13696213.png")
    plt.clf()

    print("Plotando Tarefa B4")

    headers = ["Tempo","theta_0","theta_05","theta_12","omega_0","omega_05","omega_12"]

    df = pd.read_csv("saida-B4-13696213.csv",names=headers)

    x = df["Tempo"].to_numpy()

    plt.plot(x,df["theta_0"].to_numpy())
    plt.xlabel("Tempo")
    plt.ylabel("Theta")
    #plt.savefig("./tarefa-B/tarefa-B4-graf-0-13696213.pdf")
    plt.savefig("./tarefa-B/tarefa-B4-graf-0-13696213.png")
    plt.clf()

    plt.plot(x,df["theta_05"].to_numpy())
    plt.xlabel("Tempo")
    plt.ylabel("Theta")
    #plt.savefig("./tarefa-B/tarefa-B4-graf-0_5-13696213.pdf")
    plt.savefig("./tarefa-B/tarefa-B4-graf-0_5-13696213.png")
    plt.clf()

    plt.plot(x,df["theta_12"].to_numpy())
    plt.xlabel("Tempo")
    plt.ylabel("Theta")
    #plt.savefig("./tarefa-B/tarefa-B4-graf-1_2-13696213.pdf")
    plt.savefig("./tarefa-B/tarefa-B4-graf-1_2-13696213.png")
    plt.clf()

#============= Tarefa C ============#
def C():
    print("Plotando Tarefa C")

    headers = ["Time","0.2","0.5","1.2"]

    df = pd.read_csv("saida-C-13696213.csv",names=headers)

    x = df["Time"].to_numpy()

    y=df["0.2"].to_numpy()
    plt.plot(x,y,label="Força=0.2")
    a,b = min_quad(x,y)
    plt.plot(x,[a*z + b for z in x],label="Aproximacao")
    plt.legend()
    plt.xlabel("Tempo (s)")
    plt.ylabel("Diferença de posição")
    #plt.savefig("./tarefa-C/tarefa-C-graf-0_2-13696213.pdf")
    plt.savefig("./tarefa-C/tarefa-C-graf-0_2-13696213.png")
    plt.clf()

    y=df["0.5"].to_numpy()
    plt.plot(x,y,label="Força=0.5")
    a,b = min_quad(x,y)
    plt.plot(x,[a*z + b for z in x],label="Aproximacao")
    plt.xlabel("Tempo (s)")
    plt.ylabel("Diferença de posição")
    #plt.savefig("./tarefa-C/tarefa-C-graf-0_5-13696213.pdf")
    plt.savefig("./tarefa-C/tarefa-C-graf-0_5-13696213.png")
    plt.clf()

    y=df["1.2"].to_numpy()
    plt.plot(x,y,label="Força=1.2")
    a,b = min_quad(x,y)
    plt.plot(x,[a*z + b for z in x],label="Aproximacao")
    plt.xlabel("Tempo (s)")
    plt.ylabel("Diferença de posição")
    #plt.savefig("./tarefa-C/tarefa-C-graf-1_2-13696213.pdf")
    plt.savefig("./tarefa-C/tarefa-C-graf-1_2-13696213.png")
    plt.clf()

#=============== Tarefa D ===============#
def D():
    print("Plotando Tarefa D")

    headers = ["theta-F1","omega-F1","theta-F2","omega-F2","theta-F3","omega-F3"]

    df = []

    for i in range(0,11):
        df.append(pd.read_csv(f"./tarefa-D/saida-D/saida-D-13696213-{i}.csv",names=headers))

    for i in range(0,11):
        x=df[i]["theta-F1"].to_numpy()
        y=df[i]["omega-F1"].to_numpy()
        plt.scatter(x,y,s=1)
    #Tá horríve esse, vou pensar nele depois
    #Mas individualmente ele tá bom
    #plt.savefig("./tarefa-D/tarefa-D-graf-13696213.png")
    plt.savefig("./tarefa-D/tarefa-D-graf-13696213.png")
    plt.clf()

#============ Tarefa E ==========#
def E():
    print("Plotando Tarefa E")

    headers = ["Time","theta1","omega1","theta2","omega2","theta3","omega3"]

    df = pd.read_csv("saida-E-13696213.csv",names=headers)

    plt.scatter(df["theta1"].to_numpy(),df["omega1"].to_numpy(),s=3)
    plt.xlabel("Theta")
    plt.ylabel("Omega")
    #plt.savefig("./tarefa-E/tarefa-E-graf-1-13696213.pdf")
    plt.savefig("./tarefa-E/tarefa-E-graf-1-13696213.png")
    plt.clf()

    plt.scatter(df["theta2"].to_numpy(),df["omega2"].to_numpy(),s=3)
    plt.xlabel("Theta")
    plt.ylabel("Omega")
    #plt.savefig("./tarefa-E/tarefa-E-graf-2-13696213.pdf")
    plt.savefig("./tarefa-E/tarefa-E-graf-2-13696213.png")
    plt.clf()

    plt.scatter(df["theta3"].to_numpy(),df["omega3"].to_numpy(),s=3)
    plt.xlabel("Theta")
    plt.ylabel("Omega")
    #plt.savefig("./tarefa-E/tarefa-E-graf-3-13696213.pdf")
    plt.savefig("./tarefa-E/tarefa-E-graf-3-13696213.png")
    plt.clf()

def min_quad(x,y):
    bar_x = sum(x)/len(x)
    bar_y = sum(y)/len(y)

    a_baixo = 0
    a_cima = 0
    for i in range(len(x)):
        a_baixo += (x[i]-bar_x)**2
        a_cima += (x[i]-bar_x)*y[i]

    a = a_cima/a_baixo
    b = bar_y - a*bar_x

    return a,b

#op = input("Qual operação deseja fazer?(0 para fazer todas)")
op="0"

if(op=="0"):
    A()
    B()
    C()
    D()
    E()
elif(op=="A"):
    A()
elif(op=="B"):
    B()
elif(op=="C"):
    C()
elif(op=="D"):
    D()
elif(op=="E"):
    E()