%ex2_1.m
Z1=[1 2 4;3 4 1];Z2=[-1 2 2;-5 -6 1];    
b=[0;-1];q=3;                       
Z=concur(b,q)                     
X1=netsum(Z1,Z2),X2=netprod(Z1,Z2)
