import numpy as np
import matplotlib.pyplot as plt

def sin(x):
    return np.sin(x)
def cos(x):
    return np.cos(x)

pi = np.pi
e = np.e
N = 10000
fs = 99
ft = 100

sample_data = [0]*N
sample_data2 = [0]*N
t = [0]*N
t2 = [0]*N


for i in range(N):
    sample_data[i] = sin((pi)+2*pi*ft*i/N)
    sample_data2[i] = sin(2*pi*fs*i/N)
    # sample_data[i] = sin(2*pi*ft*i/1000)
    t[i] = i

count = 0
for i in range(N):
    if (count == 0):
        sample_data2[i] = sample_data[i]
        # count = 0
    else:
        sample_data2[i] = sample_data2[i-1]
        
    count = count +1
    if(count == 99):
        count = 0


plt.plot(t, sample_data)
plt.plot(t, sample_data2, color = "red")
plt.grid()
plt.show()