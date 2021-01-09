%ex2_27.m
C=[0 1;0 1];clusters=5;points=10;std_dev=0.05;
X=input('根据书中例题输入参数X=');
plot(X(1,:),X(2,:),'+r');xlabel('X(1)') ;ylabel('X(2)')

net=newc([0 1;0 1],5,0.1);
w=net.iw{1};              
net.trainParam.epochs=7;    
net=init(net);net=train(net,X);
w1=net.iw{1};            
plot(X(1,:),X(2,:),'+r');
xlabel('X(1)') ;ylabel('X(2)')
hold on;plot(w1(:,1),w1(:,2),'ob');hold off  

X1=[0.6;0.8];y=sim(net,X1)
