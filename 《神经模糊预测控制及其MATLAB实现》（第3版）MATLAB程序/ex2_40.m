%ex2_40.m
X=[1 2 3 4 5];T=input('�������������������T=');
net=newlind(X,T);      
y=sim(net,X)
gensim(net,-1)