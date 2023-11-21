import matplotlib.pyplot as plt
import pandas as pd
import numpy as np

#=============== Tarefa A =======================#
def A():
    print("Plotando Tarefa A")

    headers = ["Time","Theta Erro","Omega Erro","Energy Erro","Theta","Omega","Energy"]

    df = pd.read_csv("./tarefa-A/saida-A-13696213.csv",names=headers)

    x = df["Time"].to_numpy()

    plt.plot(x,df["Theta Erro"].to_numpy(),label="Método de Euler")
    plt.plot(x,df["Theta"].to_numpy(),label="Método de Euler-Cromer")
    plt.legend()
    plt.xlabel("Tempo")
    plt.ylabel(r"$\theta$")
    plt.savefig("./tarefa-A/tarefa-A-graf-posicao-13696213.pdf")
    plt.clf()

    plt.plot(x[:10_000],df["Energy Erro"].to_numpy()[:10_000],label="Método de Euler")
    plt.plot(x[:10_000],df["Energy"].to_numpy()[:10_000],label="Método de Euler-Cromer")
    plt.legend()
    plt.xlabel("Tempo")
    plt.ylabel("Energia")
    plt.savefig("./tarefa-A/tarefa-A-graf-energia-13696213.pdf")
    plt.clf()

#=============== Tarefa B =======================#
def B():
    print("Plotando Tarefa B1")

    headers = ["Theta_0","Simulacao","Integral"]

    df = pd.read_csv("./tarefa-B/saida-B1-13696213.csv",names=headers)

    x = df["Theta_0"].to_numpy()

    plt.plot(x,df["Simulacao"].to_numpy(),label="Simulação")
    plt.plot(x,df["Integral"].to_numpy(),label="Integral")
    plt.legend()
    plt.xlabel(r"$\theta$")
    plt.ylabel("Período (T)")
    plt.savefig("./tarefa-B/tarefa-B1-graf-periodo-13696213.pdf")
    plt.clf()

    print("Plotando Tarefa B2")

    headers = ["Theta_0","Simulacao","Integral","Formula"]

    df = pd.read_csv("./tarefa-B/saida-B2-13696213.csv",names=headers)

    x = df["Theta_0"].to_numpy()

    plt.plot(x,df["Simulacao"].to_numpy(),label="Simulação")
    plt.plot(x,df["Integral"].to_numpy(),label="Integral")
    plt.plot(x,df["Formula"].to_numpy(),label="Aproximação Analítica")
    plt.legend()
    plt.xlabel(r"$\theta$")
    plt.ylabel("Período (T)")
    plt.savefig("./tarefa-B/tarefa-B2-graf-periodo-13696213.pdf")
    plt.clf()

    print("Plotando Tarefa B3")

    headers = ["Tempo","Theta","Omega"]

    df = pd.read_csv("./tarefa-B/saida-B3-13696213.csv",names=headers)

    x = df["Tempo"].to_numpy()

    plt.plot(x,df["Theta"].to_numpy(),label="Posição")
    plt.xlabel("Tempo")
    plt.ylabel(r"$\theta$")
    plt.savefig("./tarefa-B/tarefa-B3-graf-posicao-13696213.pdf")
    plt.clf()

    print("Plotando Tarefa B4")

    headers = ["Tempo","theta_0","theta_02","theta_05","theta_12","omega_0","omega_02","omega_05","omega_12"]

    df = pd.read_csv("./tarefa-B/saida-B4-13696213.csv",names=headers)

    x = df["Tempo"].to_numpy()

    plt.plot(x,df["theta_0"].to_numpy(),label=r"$\theta(t)$")
    plt.plot(x,df["omega_0"].to_numpy(),label=r"$\omega(t)$")
    plt.xlabel("Tempo")
    plt.ylabel(r"$\theta;\omega$")
    plt.legend()
    plt.savefig("./tarefa-B/tarefa-B4-graf-0_0-13696213.pdf")
    plt.clf()

    plt.plot(x,df["theta_02"].to_numpy(),label=r"$\theta(t)$")
    plt.plot(x,df["omega_02"].to_numpy(),label=r"$\omega(t)$")
    plt.legend()
    plt.xlabel("Tempo")
    plt.ylabel(r"$\theta;\omega$")
    plt.savefig("./tarefa-B/tarefa-B4-graf-0_2-13696213.pdf")
    plt.clf()

    plt.plot(x,df["theta_05"].to_numpy(),label=r"$\theta(t)$")
    plt.plot(x,df["omega_05"].to_numpy(),label=r"$\omega(t)$")
    plt.legend()
    plt.xlabel("Tempo")
    plt.ylabel(r"$\theta;\omega$")
    plt.savefig("./tarefa-B/tarefa-B4-graf-0_5-13696213.pdf")
    plt.clf()

    plt.plot(x,df["theta_12"].to_numpy(),label=r"$\theta(t)$")
    plt.plot(x,df["omega_12"].to_numpy(),label=r"$\omega(t)$")
    plt.legend()
    plt.xlabel("Tempo")
    plt.ylabel(r"$\theta;\omega$")
    plt.savefig("./tarefa-B/tarefa-B4-graf-1_2-13696213.pdf")
    plt.clf()

#============= Tarefa C ============#
def C():
    print("Plotando Tarefa C")

    headers = ["Time","0.2","0.5","1.2"]

    df = pd.read_csv("./tarefa-C/saida-C-13696213.csv",names=headers)

    x = df["Time"].to_numpy()

    y=df["0.2"].to_numpy()
    plt.plot(x,y,label=r"$F_0=0.2$")
    a,b = min_quad(x,y)
    plt.plot(x,[a*z + b for z in x],label="Regressão Linear")
    plt.legend()
    plt.xlabel("Tempo")
    plt.ylabel(r"$\ln(\Delta \theta)$")
    plt.text(0,-16,r"$\lambda=$"+f"{round(a,3)}",fontsize=10)
    plt.savefig("./tarefa-C/tarefa-C-graf-0_2-13696213.pdf")
    plt.clf()

    y=df["0.5"].to_numpy()
    plt.plot(x,y,label=r"$F_0=0.5$")
    a,b = min_quad(x,y)
    plt.plot(x,[a*z + b for z in x],label="Regressão Linear")
    plt.legend()
    plt.xlabel("Tempo")
    plt.ylabel(r"$\ln(\Delta \theta)$")
    plt.text(70,-12.5,r"$\lambda=$"+f"{round(a,3)}",fontsize=10)
    plt.savefig("./tarefa-C/tarefa-C-graf-0_5-13696213.pdf")
    plt.clf()

    y=df["1.2"].to_numpy()
    plt.plot(x,y,label=r"$F_0=1.2$")
    a,b = min_quad(x,y)
    plt.plot(x,[a*z + b for z in x],label="Regressão Linear")
    plt.legend()
    plt.xlabel("Tempo")
    plt.ylabel(r"$\ln(\Delta \theta)$")
    plt.text(70,-12,r"$\lambda=$"+f"{round(a,3)}",fontsize=10)
    plt.savefig("./tarefa-C/tarefa-C-graf-1_2-13696213.pdf")
    plt.clf()

#=============== Tarefa D ===============#
def D():
    print("Plotando Tarefa D")

    headers = ["theta-F1","omega-F1","theta-F2","omega-F2","theta-F3","omega-F3"]

    for j in range(1,4):
        for i in range(0,4):
            df = pd.read_csv(f"./tarefa-D/saida-D/saida-D-13696213-{i}.csv",names=headers)
            x=df[f"theta-F{j}"].to_numpy()
            y=df[f"omega-F{j}"].to_numpy()
            plt.scatter(x,y,s=6-i)
        plt.xlabel(r"$\theta$")
        plt.ylabel(r"$\omega$")
        plt.savefig(f"./tarefa-D/tarefa-D-graf-{j}-13696213.pdf")
        plt.clf()

#============ Tarefa E ==========#
def E():
    print("Plotando Tarefa E")

    headers = ["Time","theta1","omega1","theta2","omega2","theta3","omega3"]

    for j in range(1,4):
        for i in range(0,4):
            df = pd.read_csv(f"./tarefa-E/saida-E/saida-E-{i}-13696213.csv",names=headers)

            plt.scatter(df[f"theta{j}"].to_numpy(),df[f"omega{j}"].to_numpy(),s=5-i)
            plt.xlabel(r"$\theta$")
            plt.ylabel(r"$\omega$")
        plt.savefig(f"./tarefa-E/tarefa-E-graf-{j}-13696213.pdf")
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