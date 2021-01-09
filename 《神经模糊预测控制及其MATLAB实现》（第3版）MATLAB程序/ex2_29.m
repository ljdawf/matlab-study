%ex2_29.m
X=input('根据书中例题输入参数X=');
plot(X(1,:),X(2,:),'+r');xlabel('X(1)') ;ylabel('X(2)')
net=newsom([0 1;0 1],[5 6]);
w =net.iw{1,1};                             
plotsom(w,net.layers{1}.distances)        
for i=10:30:100
net.trainParam.epochs=i;                       
net=train(net,X);
figure;plotsom(net.iw{1,1},net.layers{1}.distances)  
end

X1=[0.5;0.3];y=sim(net,X1)
