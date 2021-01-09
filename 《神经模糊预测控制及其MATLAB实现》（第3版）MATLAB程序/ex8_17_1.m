%ex8_17_2
g11=poly2tfd(12.8,[16.7  1],0,1);
g21=poly2tfd(6.6,[10.9  1],0,7);
g12=poly2tfd(-18.9,[21.0  1],0,3);
g22=poly2tfd(-19.4,[14.4  1],0,3);  
delt=1; 
ny=2;
imod=tfd2mod(delt,ny,g11,g21,g12,g22);
gw1=poly2tfd(3.8, [14.9  1],0,8);
gw2=poly2tfd(4.9, [13.2  1],0,3);
pmod=addumd(imod,tfd2mod(delt,ny,gw1,gw2));

P=input('根据书中例题输入参数P=');M=input('根据书中例题输入参数M=');
ywt=[ ];uwt=[1  1];
Ks=smpccon(imod,ywt,uwt,M,P);
r=[ ];
ulim=[ ];
z=[ ];
v=[ ];
w=[1];
wu=[ ];
tend=30;
[y3,u3]=smpcsim(pmod,imod,Ks,tend,r,ulim,[],z,v,w,wu);

Kest1=smpcest(pmod,1,0.001*eye(ny));
Ks1=smpccon(pmod,ywt,uwt,M,P);
[y1,u1]=smpcsim(pmod,pmod,Ks1,tend,r,ulim,Kest1,z,v,w,wu);
plotall(y1,u1,delt)
