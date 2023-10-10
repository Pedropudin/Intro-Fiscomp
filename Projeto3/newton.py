def f(x):
    return x**3 - 4*x**2 - 59*x + 126

def df(x):
    return 3*x**2 - 8*x - 59

x=float(input("insira x:"))
print(f(x),df(x))
print("f(x)/f'(x)=",f(x)/df(x))
