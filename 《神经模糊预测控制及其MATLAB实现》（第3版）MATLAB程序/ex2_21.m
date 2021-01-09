%ex2_21.m
X=input('根据书中例题输入参数X=');T=input('根据书中例题输入参数T=')     
net=newfftd(minmax(X),0,[10 2],{'tansig','purelin'},'trainlm'); 
net=train(net,X,T) ;             
X1=X;Y=sim(net,X1)




