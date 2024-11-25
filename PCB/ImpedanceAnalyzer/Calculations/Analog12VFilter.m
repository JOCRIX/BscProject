order = 100
dBstopatt = 30
wstop = 1
[NumPoly DenomPoly] =cheby2(order,dBstopatt, wstop,'s')

h = tf(NumPoly, DenomPoly)

bode(h)

[z, p, k] = cheb2ap(3, 30)