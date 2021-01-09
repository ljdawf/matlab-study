%ex2_32.m
Time=1:80;X1=sin(1:20);X2=2*sin(1:20);
t1=ones(1,20);t2=2*ones(1,20);X=input('根据书中例题输入参数X=');T=[t1 t2 t1 t2];
%X=con2seq(P);T=con2seq(t);         
figure;plot(Time,X,'--',Time,T); xlabel('t');ylabel('X,T');
S1=10;[w1,b1,w2,b2]=initelm(X,S1,T);
df=10; me=5000; tp=[df me];                
figure;[w1,b1,w2,b2]=trainelm(w1,b1,w2,b2,X,T,tp)
y=simuelm(X,w1,b1,w2,b2);
figure;plot(Time,y,'--',Time,T); xlabel('t');ylabel('y,T');


