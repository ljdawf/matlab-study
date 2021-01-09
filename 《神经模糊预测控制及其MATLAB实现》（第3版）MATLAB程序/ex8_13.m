%ex8_13
g11=poly2tfd(12.8,[11.2 1],0,1);g21=poly2tfd(6.6,[5.2 1],0,2);
g22=poly2tfd(1.3,[5 1],0,5);g12=poly2tfd(-1.2,[3.0 1],0,4);
delt=3;ny=2;tfinal=90;
model=tfd2step(tfinal,delt,ny,g11,g21,g12,g22);plant=model;
p=input('根据书中例题输入参数p=');m=input('根据书中例题输入参数m=');                           
ywt=[];uwt=[1 1];kmpc=mpccon(model,ywt,uwt,m,p);
r=[0 1];tend=40;
[y,u,ym]=mpcsim(model,model,kmpc,tend,r);  
plotall(y,u,delt)                          
