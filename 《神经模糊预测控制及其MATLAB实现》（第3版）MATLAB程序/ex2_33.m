%ex2_33.m
Time=1:80;X1=sin(1:20);X2=2*sin(1:20);t1=ones(1,20);t2=2*ones(1,20);
P=[X1 X2 X1 X2];t=[t1 t2 t1 t2];
X=con2seq(P);T=con2seq(t); 
figure;plot(Time,cat(2,X{:}),'--',Time,cat(2,T{:}));

[R,N]=size(X);[S2,N]=size(T);S1=10;
net=newelm([-2 2],[S1 S2],{'tansig','purelin'},'traingdx');xlabel('t');ylabel('X,T');

net.trainParam.epochs=5000;         
[net,tr]=train(net,X,T);

y=sim(net,X); 

figure;plot(Time,cat(2,y{:}),Time,cat(2,T{:}),'--');xlabel('t');ylabel('y,T');


