%ex2_18.m
lr=0.05;                   
err_goal=0.001;                  
max_epoch=10000;            
X=input('根据书中例题输入参数X=');T=input('根据书中例题输入参数T=')    
[M,N]=size(X);q=10;[L,N]=size(T);  
Wij=rand(q,M);                   
Wki=rand(L,q);                   
b1=zeros(q,1);b2=zeros(L,1);        
for epoch=1:max_epoch
    Oi=tansig(Wij*X,b1);         
    Ok=purelin(Wki*Oi,b2);     
    E=T-Ok;                  
    deltak=deltalin(Ok,E);   
    deltai=deltatan(Oi,deltak,Wki); 
    [dWki,db2]=learnbp(Oi,deltak,lr);Wki=Wki+dWki;b2=b2+db2;
    [dWij,db1]=learnbp(X,deltai,lr);Wij=Wij+dWij;b1=b1+db1; 
    SSE=sumsqr(T-purelin(Wki*tansig(Wij*X,b1),b2));
    if (SSE<err_goal)  break;end
end
epoch                         
X1=X;                         
Oi=tansig(Wij*X1,b1);           
Ok=purelin(Wki*Oi,b2)
