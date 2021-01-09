%ex8_20
g=poly2tfd(2,[4  1],0,3); plant=tfd2step(30,2,1,g);
plotstep(plant)




