%ex8_5
num=input('�������������������num=');den=input('�������������������den='); [A,B,C,D]=tf2ss(num,den)
pmod=ss2mod(A,B,C,D)


