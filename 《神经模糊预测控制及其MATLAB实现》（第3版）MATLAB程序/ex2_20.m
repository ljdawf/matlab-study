%ex2_20.m
X=input('�������������������X=');T=input('�������������������T=')   
net=newff(minmax(X),[10 1],{'tansig','purelin'},'trainlm')
w=net.LW{2,1};b=net.b{2};
Y1=sim(net,X);plot(X,T,'-',X,Y1,'--')


