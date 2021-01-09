%ex8_1.m
num=input('根据书中例题输入参数num=');den=input('根据书中例题输入参数den=');     
 h=tf(num,den);

[u,t]=gensig('pulse',2,10,0.1); x=u;

t=0:0.1:10; [y,x1,t1]=lsim(h,x,t);

[ax,mx,stdx]=autosc(x); mx=0;sx=scal(x,mx,stdx);

n=35; [xreg,yreg]=wrtreg(sx,y,n);

ninput=1; plotopt=2;
[theta,yres]=mlr(xreg,yreg,ninput,plotopt);
