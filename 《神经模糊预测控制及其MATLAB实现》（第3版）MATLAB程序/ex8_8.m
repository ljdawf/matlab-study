%ex8_8
num=input('根据书中例题输入参数num=');den=input('根据书中例题输入参数den='); 
tf1=poly2tfd(num,den,0,0);
plant=tfd2step(5,0.1,1,tf1);    
plotstep(plant)



