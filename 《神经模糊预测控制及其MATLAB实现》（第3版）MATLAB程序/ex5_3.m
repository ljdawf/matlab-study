%ex5_3.m
fisMat=newfis('ex5_3');
fisMat=addvar(fisMat,'input','温度',[0  30]);
fisMat=addvar(fisMat,'input','压力',[0  3]);
fisMat=addvar(fisMat,'output','阀增量',[-10  10]);
fisMat=addmf(fisMat,'input',1,'冷','trapmf',[0 0 10 20]);
fisMat=addmf(fisMat,'input',1,'热','trapmf',[10 20 30 30]);
fisMat=addmf(fisMat,'input',2,'正常','trimf',[0 1 2]);
fisMat=addmf(fisMat,'input',2,'高','trapmf',[1 2 3 3]);
fisMat=addmf(fisMat,'output',1,'负','trimf',[-10 -5 0]);
fisMat=addmf(fisMat,'output',1,'零','trimf',[-5 0 5]);
fisMat=addmf(fisMat,'output',1,'正','trimf',[0 5 10]);
rulelist=input('根据书中例题输入参数rulelist=');fisMat=addrule(fisMat,rulelist);
gensurf(fisMat);in=[5 1.5;11 2];out=evalfis(in,fisMat)
