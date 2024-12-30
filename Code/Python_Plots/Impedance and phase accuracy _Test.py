import numpy as np
import matplotlib.pyplot as plt

f = [0]*1000
A = [0]*1000
P = [0]*1000

Z = [0]*1000
AZ = [0]*1000
PZ = [0]*1000

for i in range(1000):
    f[i] = 49+1.0*10**((i)/166.500591)
    A[i] = 0.1+abs(np.log10(f[i]/1000))*0.3
    P[i] = (A[i]/100) * 180/np.pi

for i in range(1000):
    Z[i] = 0.01*10**((i)/99.9)
    AZ[i] = 0.1+abs(np.log10(Z[i]/1000))*0.3
    PZ[i] = (AZ[i]/100) * 180/np.pi
print(Z[0])



x = [10, 159, 1066, 10000, 100000, 5844100]
y = [0.0256, 0.267, 0.487, 0.026, 0.02, 0.865]
y_er = [0.1, 1, 1, 0.1, 0.1, 2]

fig, axes = plt.subplots(nrows = 1, ncols =2, figsize = (10,6))
fig.tight_layout()

plt.subplot(1,2,1)

plt.semilogx(f,A)
plt.scatter([10, 1000, 100000, 1000000], [0.23, 0.08, 0.13, 0.26])
plt.grid(True,which= "major", axis = "both")
# plt.grid(True,which= "minor", axis = "both")
plt.ylabel("Accuracy in %")
plt.xlabel("Frequency in Hz")
plt.title("Accuracy vs. Frequency at 1 kOhm")
# plt.show()

plt.subplot(1,2,2)
plt.semilogx(Z,AZ)
plt.scatter([1, 10, 1000, 100000], [0.63, 0.24, 0.08, 0.14])
plt.errorbar(x,y,y_er, fmt = 'o', color = "red")


plt.grid(True,which= "major", axis = "both")
# plt.grid(True,which= "minor", axis = "both")
plt.ylabel("Accuracy in %")
plt.xlabel("Impedance in Ohm")
plt.title("Accuracy vs. Impedance at 1 kHz")
plt.show()

# fig, axes = plt.subplots(nrows = 1, ncols =2, figsize = (10,6))
# fig.tight_layout()

# plt.subplot(1,2,1)

# plt.semilogx(f,P)
# plt.scatter([10, 1000, 100000, 1000000], [0.157, 0.071, 0.099, 0.174])
# plt.grid(True,which= "major", axis = "both")
# # plt.grid(True,which= "minor", axis = "both")
# plt.ylabel("Accuracy in degrees")
# plt.xlabel("Frequency in Hz")
# plt.title("Phase Accuracy vs. Frequency at 1 kOhm")
# # plt.show()

# plt.subplot(1,2,2)
# plt.semilogx(Z,PZ)
# plt.scatter([1, 10, 1000, 100000], [0.386, 0.163, 0.071, 0.105])
# plt.grid(True,which= "major", axis = "both")
# # plt.grid(True,which= "minor", axis = "both")
# plt.ylabel("Accuracy in degrees")
# plt.xlabel("Impedance in Ohm")
# plt.title("Phase Accuracy vs. Impedance at 1 kHz")
# plt.show()