%ex2_6.m
X=input('�������������������X=');T=input('�������������������T=')               
plotpv(X,T);                      
[W,b]=initp(X,T);                 
figure;plotpv(X,T);plotpc(W,b);       
figure;[W,b,epochs,errors]=trainp(W,b,X,T,-1);
figure;ploterr(errors);            
X1=X;                   
y=simup(X1,W,b)
                 
