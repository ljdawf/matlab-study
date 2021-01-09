%ex2_4.m
X=input('根据书中例题输入参数X=');T=input('根据书中例题输入参数T=') 
[W,b]=initp(X,T); tp=[1 20]; 
[W,b,epochs,errors]=trainp(W,b,X,T,tp); 
plotpv(X,T);plotpc(W,b)
                  
