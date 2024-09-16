import numpy as np
import matplotlib.pyplot as plt

def sin(x):
    return np.sin(x)
def cos(x):
    return np.cos(x)

pi = np.pi
e = np.e
N = 1000


sample_data = [0]*N
t = [0]*N
sample_data2 = [0]*N
DFT_data = [0]*int(float(N)/2)
DFT_data2 = [0]*int(float(N)/2)
DFT_phase = [0]*int(float(N)/2)
DFT_phase2 = [0]*int(float(N)/2)

for i in range(N):
    sample_data[i] = sin(1*2*pi*i/N)
    sample_data2[i] = 0.1*sin(0.7+1*2*pi*i/N)
    t[i]=i


def spotDFT(x, k):
    X = 0
    n = len(x)
    for i in range(n-1):
        X = X + x[i]*e**(-1j*(2*pi/n)*k*i)
    return(X/n)


# print(spotDFT(sample_data, 20))

for k in range(int(float(N)/2)):
    X = spotDFT(sample_data, k)
    X2 = spotDFT(sample_data2, k)
    DFT_data[k] = np.sqrt((np.imag(X)**2)+np.real(X)**2)
    DFT_data2[k] = np.sqrt((np.imag(X2)**2)+np.real(X2)**2)
    if DFT_data[k] <= 0.01:
        DFT_phase[k] = 0
    else:
        DFT_phase[k] = np.arctan(np.imag(X)/np.real(X))*360/(2*pi)

    if DFT_data2[k] <= 0.01:
        DFT_phase2[k] = 0
    else:
        DFT_phase2[k] = np.arctan(np.imag(X2)/np.real(X2))*360/(2*pi)



# k=1000

# X = spotDFT(sample_data, k)
# X2 = spotDFT(sample_data2, k)

# DFT_data[k] = np.sqrt((np.imag(X)**2)+np.real(X)**2)
# DFT_data2[k] = np.sqrt((np.imag(X2)**2)+np.real(X2)**2)
# DFT_phase[k] = np.arctan(np.imag(X)/np.real(X))*360/(2*pi)
# DFT_phase2[k] = np.arctan(np.imag(X2)/np.real(X2))*360/(2*pi)


print("Impedance: ", (DFT_data[k])/DFT_data2[k])
print("Phase: ", DFT_phase[k]-DFT_phase2[k])

# plt.plot(t,sample_data, t,sample_data2)
# plt.plot(DFT_data)
plt.plot(DFT_phase2)
plt.grid()
plt.show()