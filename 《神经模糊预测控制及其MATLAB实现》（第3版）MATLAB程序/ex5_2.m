%ex5_2.m
fisMat=newfis('ex5_2','sugeno');
fisMat=addvar(fisMat,'input','x',[0  15]);
fisMat=addvar(fisMat,'output','y',[0  15]);
fisMat=addmf(fisMat,'input',1,'С','gaussmf',[3.4  0]);
fisMat=addmf(fisMat,'input',1,'��','gaussmf',[3.4  8]);
fisMat=addmf(fisMat,'input',1,'��','gaussmf',[3.4  15]);
fisMat=addmf(fisMat,'output',1,'��1��','linear',[1 0]);
fisMat=addmf(fisMat,'output',1,'��2��','linear',[-0.5 9]);
fisMat=addmf(fisMat,'output',1,'��3��','linear',[2 -18.5]);
rulelist=input('�������������������rulelist=');
fisMat=addrule(fisMat,rulelist);
subplot(2,1,1);plotmf(fisMat,'input',1);subplot(2,1,2);gensurf(fisMat);
getfis(fisMat,'output',1,'mf',1); getfis(fisMat,'output',1,'mf',2);
getfis(fisMat,'output',1,'mf',3);
