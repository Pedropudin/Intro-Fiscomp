import matplotlib.pyplot as plt
import pandas as pd
import numpy as np

#=============== Tarefa A =======================#
def A():
    print("Plotando Tarefa A")

    headers = ["Time","Theta Erro","Omega Erro","Energy Erro","Theta","Omega","Energy"]

    df = pd.read_csv("./tarefa-A/saida-A-13696213.csv",names=headers)

    x = df["Time"].to_numpy()

    plt.plot(x,df["Theta Erro"].to_numpy(),label="theta(t) sem correção")
    plt.plot(x,df["Theta"].to_numpy(),label="theta(t)")
    plt.legend()
    plt.savefig("./tarefa-A/tarefa-A-graf-posicao-13696213.pdf")
    plt.clf()
    #Acho que é interessante plotar só o começo da energia (talvez até o 100)
    plt.plot(x,df["Energy Erro"].to_numpy(),label="energia(t) sem correção")
    plt.plot(x,df["Energy"].to_numpy(),label="energia(t)")
    plt.legend()
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
    plt.savefig("./tarefa-B/tarefa-B1-graf-periodo-13696213.pdf")
    plt.clf()

    print("Plotando Tarefa B2")

    headers = ["Theta_0","Simulacao","Integral","Formula"]

    df = pd.read_csv("./tarefa-B/saida-B2-13696213.csv",names=headers)

    x = df["Theta_0"].to_numpy()

    plt.plot(x,df["Simulacao"].to_numpy(),label="Simulação")
    plt.plot(x,df["Integral"].to_numpy(),label="Integral")
    plt.plot(x,df["Formula"].to_numpy(),label="Formula")
    plt.legend()
    plt.savefig("./tarefa-B/tarefa-B2-graf-periodo-13696213.pdf")
    plt.clf()

    print("Plotando Tarefa B3")

    headers = ["Tempo","Theta","Omega"]

    df = pd.read_csv("./tarefa-B/saida-B3-13696213.csv",names=headers)

    x = df["Tempo"].to_numpy()

    plt.plot(x,df["Theta"].to_numpy(),label="Posição")
    plt.savefig("./tarefaB/tarefa-B3-graf-posicao-13696213.pdf")
    plt.clf()

    print("Plotando Tarefa B4")

    headers = ["Tempo","theta_0","theta_05","theta_12","omega_0","omega_05","omega_12"]

    df = pd.read_csv("./tarefa-B/saida-B4-13696213.csv",names=headers)

    x = df["Tempo"].to_numpy()

    plt.plot(x,df["theta_0"].to_numpy())
    plt.savefig("./tarefa-B/tarefa-B4-graf-0-13696213.pdf")
    plt.clf()
    plt.plot(x,df["theta_05"].to_numpy())
    plt.savefig("./tarefa-B/tarefa-B4-graf-0_5-13696213.pdf")
    plt.clf()
    plt.plot(x,df["theta_12"].to_numpy())
    plt.savefig("./tarefa-B/tarefa-B4-graf-1_2-13696213.pdf")
    plt.clf()

#============= Tarefa C ============#
def C():
    print("Plotando Tarefa C")

    headers = ["Time","0.2","0.5","1.2"]

    df = pd.read_csv("./tarefa-C/saida-C-13696213.csv",names=headers)

    x = df["Time"].to_numpy()

    plt.plot(x,df["0.2"].to_numpy(),label="Força=0.2")
    plt.savefig("./tarefa-C/tarefa-C-graf-0_2-13696213.pdf")
    plt.clf()
    plt.plot(x,df["0.5"].to_numpy(),label="Força=0.5")
    plt.savefig("./tarefa-C/tarefa-C-graf-0_5-13696213.pdf")
    plt.clf()
    plt.plot(x,df["1.2"].to_numpy(),label="Força=1.2")
    plt.savefig("./tarefa-C/tarefa-C-graf-1_2-13696213.pdf")
    plt.clf()

#=============== Tarefa D ===============#
def D():
    #print("Plotando Tarefa D")

    #headers = ["theta-F1","omega-F1","theta-F2","omega-F2","theta-F3","omega-F3"]

    #df = []

    #for i in range(0,11):
        #df.append(pd.read_csv(f"./saida-D/saida-D-13696213-{i}.csv",names=headers))

    #for i in range(0,11):
        #x=df[i]["theta-F1"].to_numpy()
        #y=df[i]["omega-F1"].to_numpy()
        #plt.scatter(x,y,s=1)
    #Tá horríve esse, vou pensar nele depois
    #Mas individualmente ele tá bom
    #plt.clf()
    pass

#============ Tarefa E ==========#
def E():
    print("Plotando Tarefa E")

    headers = ["Time","theta1","omega1","theta2","omega2","theta3","omega3"]

    df = pd.read_csv("./tarefa-E/saida-E-13696213.csv",names=headers)

    plt.scatter(df["theta1"].to_numpy(),df["omega1"].to_numpy(),s=5)
    plt.savefig("./tarefa-E/tarefa-E-graf-1-13696213.pdf")
    plt.clf()
    plt.scatter(df["theta2"].to_numpy(),df["omega2"].to_numpy(),s=5)
    plt.savefig("./tarefa-E/tarefa-E-graf-2-13696213.pdf")
    plt.clf()
    plt.scatter(df["theta3"].to_numpy(),df["omega3"].to_numpy(),s=5)
    plt.savefig("./tarefa-E/tarefa-E-graf-3-13696213.pdf")
    plt.clf()

    #df2 = pd.read_csv("resultE2.csv",names=headers)
    #df3 = pd.read_csv("resultE3.csv",names=headers)
    #plt.scatter(df["theta2"].to_numpy(),df["omega2"].to_numpy(),s=5,label="1.0")
    #plt.scatter(df2["theta2"].to_numpy(),df2["omega2"].to_numpy(),s=5,label="1.01")
    #plt.scatter(df3["theta2"].to_numpy(),df3["omega2"].to_numpy(),s=5,label="1.05")
    #plt.show()

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