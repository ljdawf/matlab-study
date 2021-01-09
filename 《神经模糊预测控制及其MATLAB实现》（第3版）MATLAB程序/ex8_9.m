%ex8_9
tf1=poly2tfd(2,[1,1],0,0);
tf2=poly2tfd(3,[1 2],0,0);                            
tf3=poly2tfd(1,[1,4],0,0);
tf4=poly2tfd(1,[1,1],0,0);
plant=tfd2step(5,0.1,2,tf1,tf2,tf3,tf4);
plotstep(plant) 




