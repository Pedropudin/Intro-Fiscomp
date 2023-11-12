import matplotlib.pyplot as plt
import pandas as pd
import numpy as np

headers = ["Time","Theta","Omega"]

df = pd.read_csv("resultB4.csv",names=headers)

plt.plot(df["Time"].to_numpy(),df["Theta"].to_numpy())
#plt.plot(df["Time"].to_numpy(),df["Omega"].to_numpy())
#plt.plot(df["Time"].to_numpy(),df["Energy"].to_numpy())

plt.show()