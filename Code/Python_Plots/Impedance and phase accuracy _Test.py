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



# x = [100, 1000, 10000, 100000, 300000]
# y = [0.00, 0.01, 0.02, 0.08, 0.06]
# y_ref = [0, 0, 0, 0, 0]
# y_er = [0.1, 0.1, 0.1, 0.1, 0.1]

# x2 = [0.015, 1, 10, 100, 1000, 10000, 100000, 1000000]
# y2 = [2.632, 0.030, 0.009, 0.007, 0.005, 0.004, 0.009, 0.016]
# y2_ref = [0, 0, 0, 0, 0, 0 ,0 ,0]
# y_er2 = [0.15, 0.5, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1]

# fig, axes = plt.subplots(nrows = 1, ncols =2, figsize = (10,6))
# fig.tight_layout()

# plt.subplot(1,2,1)

# plt.semilogx(f,A)
# plt.scatter([100, 1000, 10000, 100000, 300000], [0.105, 0.105, 0.105, 0.18, 0.33])
# plt.errorbar(x,y_ref,y_er, fmt = 'none', color = "orange", capsize= 5)
# plt.scatter(x, y, label = "Measured", color = "red", marker = "x")
# plt.grid(True,which= "major", axis = "both")
# # plt.grid(True,which= "minor", axis = "both")
# plt.ylabel("Accuracy in %")
# plt.xlabel("Frequency in Hz")
# plt.title("Accuracy vs. Frequency at 1 kOhm")
# # plt.show()

# plt.subplot(1,2,2)
# plt.semilogx(Z,AZ, label = "Specification")
# plt.scatter([0.015, 1, 10, 100, 1000, 10000, 100000, 1000000], [7.964, 0.48, 0.12, 0.107, 0.105, 0.106, 0.113, 0.405], label = "LCX-200 specification")
# plt.errorbar(x2,y2_ref,y_er2, fmt = "none", color = "orange", label = "Reference", capsize = 5)
# plt.scatter(x2, y2, label = "Measured", color = "red", marker = "x")

# plt.grid(True,which= "major", axis = "both")
# # plt.grid(True,which= "minor", axis = "both")
# plt.ylabel("Accuracy in %")
# plt.xlabel("Impedance in Ohm")
# plt.title("Accuracy vs. Impedance at 1 kHz")
# plt.legend()
# plt.show()



x = [100, 1000, 10000, 100000, 300000]
y = [0.0012, 0.0054, 0.0692, 0.4027, 1.2391]


x2 = [0.015, 1, 10, 100, 1000, 10000, 100000, 1000000]
y2 = [0.1501, 0.0296, 0.0085, 0.0073, 0.0054, 0.0044, 0.0093, 0.0160]


fig, axes = plt.subplots(nrows = 1, ncols =2, figsize = (10,6))
fig.tight_layout()

plt.subplot(1,2,1)

plt.semilogx(f,P)
plt.scatter([100, 1000, 10000, 100000, 300000], [0.06, 0.06, 0.06, 0.104, 0.190])
plt.scatter(x,y, color = "red", marker = "x")
plt.grid(True,which= "major", axis = "both")
# plt.grid(True,which= "minor", axis = "both")
plt.ylabel("Accuracy in degrees")
plt.xlabel("Frequency in Hz")
plt.title("Phase Accuracy vs. Frequency at 1 kOhm")
# plt.show()

plt.subplot(1,2,2)
plt.semilogx(Z,PZ, label = "Specification")
plt.scatter([0.015, 1, 10, 100, 1000, 10000, 100000, 1000000], [4.563, 0.275, 0.069, 0.061, 0.060, 0.061, 0.064, 0.232], label = "LCX-200 specification")
plt.scatter(x2,y2, color = "red", label = "Measured", marker = "x")
plt.grid(True,which= "major", axis = "both")
# plt.grid(True,which= "minor", axis = "both")
plt.ylabel("Accuracy in degrees")
plt.xlabel("Impedance in Ohm")
plt.title("Phase Accuracy vs. Impedance at 1 kHz")
plt.legend()
plt.show()