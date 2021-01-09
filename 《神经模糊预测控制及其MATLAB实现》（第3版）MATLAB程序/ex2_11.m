%ex2_11.m
X=input('根据书中例题输入参数X=');T=input('根据书中例题输入参数T=')  
net=newp([-1 1;-1 1],1)          
[net,Y,E]=train(net,X,T);         
X1=X;                       
y=sim(net,X1)




