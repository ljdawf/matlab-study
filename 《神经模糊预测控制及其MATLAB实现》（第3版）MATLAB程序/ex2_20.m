%ex2_20.m
X=input('根据书中例题输入参数X=');T=input('根据书中例题输入参数T=')   
net=newff(minmax(X),[10 1],{'tansig','purelin'},'trainlm')
w=net.LW{2,1};b=net.b{2};
Y1=sim(net,X);plot(X,T,'-',X,Y1,'--')


