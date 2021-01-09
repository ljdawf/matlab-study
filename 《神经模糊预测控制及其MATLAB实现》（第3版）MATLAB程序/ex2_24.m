%ex2_24.m
X=input('根据书中例题输入参数X=');T=input('根据书中例题输入参数T=')  
n=-3:0.1:3;a1=radbas(n);a2=radbas(n-1.5);a3=radbas(n+2);
a=a1+1*a2+0.5*a3;figure;plot(n,a1,n,a2,n,a3,n,a,'x');
net=newrb(X,T,0.02,1);             
X1=-1:0.01:1;y=sim(net,X1);       
figure;plot(X1,y,X,T,'+');
