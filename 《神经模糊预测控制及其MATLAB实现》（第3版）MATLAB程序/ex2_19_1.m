%ex2_19_1.m
X=input('根据书中例题输入参数X=');T=input('根据书中例题输入参数T=')   
plot(X,T,'+');
[R,N]=size(X);[S2,N]=size(T);S1=5;
[W1,b1,W2,b2]=initff(X,S1,'tansig',S2,'purelin'); 
[y1,y21]=simuff(X,W1,b1,'tansig',W2,b2,'purelin'); 
disp_freq=10;            
max_epoch=8000;        
err_goal=0.02;         
lr=0.01;                 
tp=[disp_freq  max_epoch  err_goal lr];   
[W1,b1,W2,b2,te,tr]=trainbp(W1,b1,'tansig',W2,b2,'purelin',X,T,tp);
[y1,y22]=simuff(X,W1,b1,'tansig',W2,b2,'purelin'); 
plot(X,T,'-',X,y21,'--',X,y22,'o')                  
X1=0.5; y2=simuff(X1,W1,b1,'tansig',W2,b2,'purelin')
