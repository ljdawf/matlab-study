%ex8_2.m
 num1=input('根据书中例题输入参数num1=');den1=input('根据书中例题输入参数den1='); 
   g1=poly2tfd(num1,den1,0,14);
    num2=1.52;den2=[25 1];g2=poly2tfd(num2,den2,0,15);

    mod=tfd2mod(7,1,g1,g2);

    [A,B,C,D]=mod2ss(mod);

    sys=ss(A,B,C,D);h=tf(sys);

    [u,t]=gensig('pulse',8,10,0.1); x=[u u];

    t=0:0.1:10; [y,x1,t1]=lsim(h,x,t);

    [ax,mx,stdx]=autosc(x); mx=[0 0]; sx=scal(x,mx,stdx);
   
    n=35; [xreg,yreg]=wrtreg(sx,y,n);
  
    ninput=2; plotopt=2;
   [theta,yres]=mlr(xreg,yreg,ninput,plotopt);
