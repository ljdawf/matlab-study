%ex2_16_1.m
Time=0:0.025:5;
T=input('根据书中例题输入参数T=')
Q=length(T);      
X=zeros(5,Q);X(1,2:Q)=T(1,1:(Q-1));X(2,3:Q)=T(1,1:(Q-2));
X(3,4:Q)=T(1,1:(Q-3));X(4,5:Q)=T(1,1:(Q-4));X(5,6:Q)=T(1,1:(Q-5)); 
figure;plot(Time,T);                 
[W,b]=initlin(X,T);                  
lr=0.1;                          
[y,E,W,b]= adaptwh(W,b,X,T,lr);      
figure;plot(Time,y,Time,T,'o');
