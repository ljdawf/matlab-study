%ex8_10
A=[-2 -1;1 0];B=[1;0];C=[1 2];D=0;              
plant=ss2step(A,B,C,D,5,0,0.2,1);              
plotstep(plant) 





