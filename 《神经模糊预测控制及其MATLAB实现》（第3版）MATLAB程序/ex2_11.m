%ex2_11.m
X=input('�������������������X=');T=input('�������������������T=')  
net=newp([-1 1;-1 1],1)          
[net,Y,E]=train(net,X,T);         
X1=X;                       
y=sim(net,X1)




