%ex2_7.m
X=input('�������������������X=');T=input('�������������������T=')  
[W,b]=initp(X,T);                    
[W,b,epochs,errors]=trainp(W,b,X,T,-1);
figure;ploterr(errors);                  
X1=X;y=simup(X1,W,b) 
