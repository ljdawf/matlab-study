%ex2_10.m
X=input('根据书中例题输入参数X=');T=input('根据书中例题输入参数T=')  
plotpv(X,T);                    
S1=15;                         
[W1,b1]=initp(X,S1);          
[W2,b2]=initp(S1,T);              
X1=simup(X,W1,b1);              
figure;
[W2,b2,epochs,errors]=trainpn(W2,b2,X1,T,-1);
figure;ploterr(errors);              
X1=X;                          
y1=simup(X1,W1,b1);             
y=simup(y1,W2,b2)



