%ex8_14
g=poly2tfd(3,[4 1],0,4);
plant=tfd2step(50,2,1,g);
plotstep(plant)
P=input('根据书中例题输入参数P=');M=input('根据书中例题输入参数M=');

ywt=[ ]; uwt=1;
kmpc=mpccon(plant,ywt,uwt,M,P)
[clmod,cmod]=mpccl(plant,plant,kmpc)    
tend=50; r=3;
[y,u,yrn]=mpcsim(plant,plant,kmpc,tend,r)
plotall(y,u,2)
