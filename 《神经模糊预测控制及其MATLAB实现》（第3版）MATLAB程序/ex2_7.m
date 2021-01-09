%ex2_7.m
X=input('根据书中例题输入参数X=');T=input('根据书中例题输入参数T=')  
[W,b]=initp(X,T);                    
[W,b,epochs,errors]=trainp(W,b,X,T,-1);
figure;ploterr(errors);                  
X1=X;y=simup(X1,W,b) 
