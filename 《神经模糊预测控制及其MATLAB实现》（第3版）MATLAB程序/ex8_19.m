%ex8_19
g=poly2tfd(2, [4, 1], 0, 3);
mod=tfd2mod(2, 1, g);
P=input('�������������������P=');M=input('�������������������M='); 
ywt=[ ];
uwt=1;
tend=30;
r=2; 
ulim=[-inf  inf  100];                                    
ylim=[ ];delt=2;
[y,u]=scmpc(mod,mod,ywt,uwt,M,P,tend,r,ulim,ylim); 
ploteach(y,u,delt)



