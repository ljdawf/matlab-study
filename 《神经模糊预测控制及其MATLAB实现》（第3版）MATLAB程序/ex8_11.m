%ex8_11
num=input('根据书中例题输入参数num=');den=input('根据书中例题输入参数den='); 

g=poly2tfd(num,den,0,0);

mod1=tfd2mod(0.1,1,g); 
mod2=mod2mod(mod1,0.5);                       
plant2=mod2step(mod2,5,0.1); 
plotstep(plant2)             
 





