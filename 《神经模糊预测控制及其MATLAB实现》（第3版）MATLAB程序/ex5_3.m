%ex5_3.m
fisMat=newfis('ex5_3');
fisMat=addvar(fisMat,'input','�¶�',[0  30]);
fisMat=addvar(fisMat,'input','ѹ��',[0  3]);
fisMat=addvar(fisMat,'output','������',[-10  10]);
fisMat=addmf(fisMat,'input',1,'��','trapmf',[0 0 10 20]);
fisMat=addmf(fisMat,'input',1,'��','trapmf',[10 20 30 30]);
fisMat=addmf(fisMat,'input',2,'����','trimf',[0 1 2]);
fisMat=addmf(fisMat,'input',2,'��','trapmf',[1 2 3 3]);
fisMat=addmf(fisMat,'output',1,'��','trimf',[-10 -5 0]);
fisMat=addmf(fisMat,'output',1,'��','trimf',[-5 0 5]);
fisMat=addmf(fisMat,'output',1,'��','trimf',[0 5 10]);
rulelist=input('�������������������rulelist=');fisMat=addrule(fisMat,rulelist);
gensurf(fisMat);in=[5 1.5;11 2];out=evalfis(in,fisMat)
