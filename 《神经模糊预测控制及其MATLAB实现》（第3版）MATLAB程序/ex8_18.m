%ex8_18
g=poly2tfd(3,[5 1],0,4);
mod=tfd2mod(0.1,1,g);
vmat=mod2frsp(mod,[-2,3,50],1,1,0);
plotfrsp(vmat)


