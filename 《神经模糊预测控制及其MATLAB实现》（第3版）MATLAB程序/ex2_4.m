%ex2_4.m
X=input('�������������������X=');T=input('�������������������T=') 
[W,b]=initp(X,T); tp=[1 20]; 
[W,b,epochs,errors]=trainp(W,b,X,T,tp); 
plotpv(X,T);plotpc(W,b)
                  
