%ex5_2.m
fisMat=newfis('ex5_2','sugeno');
fisMat=addvar(fisMat,'input','x',[0  15]);
fisMat=addvar(fisMat,'output','y',[0  15]);
fisMat=addmf(fisMat,'input',1,'小','gaussmf',[3.4  0]);
fisMat=addmf(fisMat,'input',1,'中','gaussmf',[3.4  8]);
fisMat=addmf(fisMat,'input',1,'大','gaussmf',[3.4  15]);
fisMat=addmf(fisMat,'output',1,'第1区','linear',[1 0]);
fisMat=addmf(fisMat,'output',1,'第2区','linear',[-0.5 9]);
fisMat=addmf(fisMat,'output',1,'第3区','linear',[2 -18.5]);
rulelist=input('根据书中例题输入参数rulelist=');
fisMat=addrule(fisMat,rulelist);
subplot(2,1,1);plotmf(fisMat,'input',1);subplot(2,1,2);gensurf(fisMat);
getfis(fisMat,'output',1,'mf',1); getfis(fisMat,'output',1,'mf',2);
getfis(fisMat,'output',1,'mf',3);
