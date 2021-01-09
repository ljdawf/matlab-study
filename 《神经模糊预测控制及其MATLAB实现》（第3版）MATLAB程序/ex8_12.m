%ex8_12

g11=poly2tfd(12.8,[16.7 1],0,1);
g21=poly2tfd(6.6,[10.9 1],0,7);
g12=poly2tfd(-18.9,[21.0 1],0,3);
g22=poly2tfd(-19.4,[14.4 1],0,3);
delt=3;
ny=2;tfinal=90;
model=tfd2step(tfinal,delt,ny,g11,g21,g12,g22);

plant=model;

p=input('根据书中例题输入参数p=');m=input('根据书中例题输入参数m=');
ywt=[];uwt=[1 1];

r=[1 1];
tend=30;                    
ulim=[-0.1 -0.1 0.5 0.5 0.1 100];
ylim=[];
[y,u,ym]=cmpc(plant,model,ywt,uwt,m,p,tend,r,ulim,ylim);
plotall(y,u,delt)

 





