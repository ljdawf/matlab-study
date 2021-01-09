%ex6_4.m
	clear,close all
	fisMat=readfis('ex6_3');  
	u1=sin(2*pi*[1:300]/250);u2=sin(pi*[301:600]/50);
	uu=[u1 u2];N=length(uu);
	y=0;y1=0;yc=0;yc1=0;out=zeros(N,4);
	for k=1:N
		u=uu(k);
		fc=evalfis(u,fisMat);
		yc2=yc1;yc1=yc;yc=0.3*yc1+0.6*yc2+fc;
	    f=0.5*sin(pi*u)+0.3*sin(3*pi*u)+0.1*sin(5*pi*u);
		y2=y1;y1=y;y=0.3*y1+0.6*y2+f;
		out(k,:)=[f fc y yc];
	end
k=1:N;
subplot(2,1,1);plot(k,out(:,1),'-',k,out(:,2),'x');legend('函数实际输出','函数逼近输出')
subplot(2,1,2);plot(k,out(:,3),'-',k,out(:,4),'x');legend('系统实际输出','系统逼近输出')


