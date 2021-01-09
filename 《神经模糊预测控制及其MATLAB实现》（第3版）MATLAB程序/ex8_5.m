%ex8_5
num=input('根据书中例题输入参数num=');den=input('根据书中例题输入参数den='); [A,B,C,D]=tf2ss(num,den)
pmod=ss2mod(A,B,C,D)


