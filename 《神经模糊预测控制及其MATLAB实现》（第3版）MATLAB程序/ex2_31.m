%ex2_31.m
X=input('根据书中例题输入参数X=');
C=[1 1 1 2 2 2 2 1 1 1];T=ind2vec(C); plotvec(X,C);
net=newlvq(minmax(X),4,[0.6 0.4],0.1)
w=net.iw{1};                           
figure;plotvec(X,C); hold on;
plot(w(1,1),w(1,2),'ow');                     
xlabel('X(1),w(1)') ;ylabel('X(2),w(2)');hold off;
 
net.trainParam.epochs=150;             
net.trainParam.show=Inf;  
net=train(net,X,T);
figure;plotvec(X,C);hold on; plotvec(net.iw{1},vec2ind(net.lw{2}),'o')  
X1=[0.8;0.3];y1=sim(net,X1)y=vec2ind(y1)


