%ex2_26.m
X=input('�������������������X=');
net=newc([0 1;0 1],2);net=train(net,X);
y=sim(net,X),yc=vec2ind(y)

