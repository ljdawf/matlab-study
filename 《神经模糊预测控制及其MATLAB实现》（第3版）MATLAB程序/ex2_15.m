%ex2_15.m
Time=0:0.025:5;
X=input('根据书中例题输入参数X=');T=input('根据书中例题输入参数T=')
figure;plot(Time,X ,Time,T,'--');
Q=length(T);
X1=zeros(3,Q);X1(1,1:Q)=T(1,1:Q); 
X1(2,2:Q)=T(1,1:(Q-1));X1(3,3:Q)=T(1,1:(Q-2)); 
[w,b]=solvelin(X1,T);               
y=simulin(X1,w,b);                 
figure;plot(Time,y, '+',Time,T,'-' ,Time,T-y,'x');
