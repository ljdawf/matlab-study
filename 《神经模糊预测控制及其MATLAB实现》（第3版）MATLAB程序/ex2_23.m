%ex2_23.m
X=input('根据书中例题输入参数X=');T=input('根据书中例题输入参数T=') 
plot(X,T,'+');
disp_freg=10;      
max_neuron=100;   
err_goal=0.02;    
sc=1;                     
dp=[disp_freg max_neuron err_goal sc];
[W1,b1,W2,b2]=solverb(X,T,dp);
X1=0.5;y=simurb(X1,W1,b1,W2,b2) 
