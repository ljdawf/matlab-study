%ex8_16_1
T=2;
  g11=poly2tfd(12.8,[16.7  1],0,1); 
  g21= poly2tfd(6.6,[10.9  1],0,7);
  g12=poly2tfd(-18.9,[21.0  1],0,3); 
  g22= poly2tfd(-19.4,[14.4  1],0,3);    
  umod=tfd2mod(T,2,g11,g21,g12,g22);

  g13=poly2tfd(3.8,[14.9 1],0,8);
  g23=poly2tfd(4.9,[13.2 1],0,3);
  dmod=tfd2mod(T,2,g13,g23);

  pmod=addumd(umod,dmod);

  imod=pmod;
  ywt=[ ]; 
  uwt=[ ];

  P=input('根据书中例题输入参数P=');M=P;
  Ks=smpccon(imod,ywt,uwt,M,P);

  tend=30;
  r=[1 0];
  [y,u]=smpcsim(pmod,imod,Ks,tend,r);
  plotall(y,u,T)


