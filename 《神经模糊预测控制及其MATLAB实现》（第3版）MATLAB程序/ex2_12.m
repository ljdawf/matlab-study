%ex2_12.m
X=input('根据书中例题输入参数X=');T=input('根据书中例题输入参数T=') 
net=newp([-1 1;-1 1],1);    
net.performFcn='mae';     
net.trainParam.goal=0.01;   
net.trainParam.epochs=50;  
net.trainParam.show=1;    
net.trainParam.mc=0.95;            
[net,tr]=train(net,X,T); 
testX=[-0.5 0.3 -0.9 0.4 -0.1 0.2 -0.6 0.8 0.1 0.4; 
-0.3 -0.8 -0.4 -0.7 0.4 -0.6 0.1 -0.5 -0.5 0.3] 
y=sim(net,testX) ;
figure;plotpv(testX,y) 
plotpc(net.iw{1},net.b{1});
