%ex8_3.m
    num=input('根据书中例题输入参数num=');den=input('根据书中例题输入参数den=');  h=tf(num,den);

    [u,t]=gensig('pulse',2,10,0.1);x=[u];

    t=0:0.1:10; [y,x1,t1]=lsim(h,x,t);

    n=30; [xreg,yreg]=wrtreg(x,y,n);

    ninput=2;lv=10;plotopt=2;    
theta=plsr(xreg,yreg,ninput,lv,plotopt);

