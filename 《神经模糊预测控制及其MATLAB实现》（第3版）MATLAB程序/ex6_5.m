%ex6_5.m
numPts=input('根据书中例题输入参数numPts=');
x=linspace(-1,1,numPts);y=0.5*sin(pi*x)+0.3*sin(3*pi*x)+0.1*sin(5*pi*x);
data=[x' y']; trnData=data(1:2:numPts,:);chkData=data(2:2:numPts,:);



