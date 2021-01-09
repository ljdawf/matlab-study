%ex5_6.m
num=input('根据书中例题输入参数num=');den=input('根据书中例题输入参数den=');
[A,b,c,d]=tf2ss(num,den);
T=0.01;h=T;tao=0.02;Nd=tao/T; 
Umin=0.07;Umax=0.7;	N=500;R=1.0*ones(1,N);
fisMat=newfis('ex5_4');
fisMat=addvar(fisMat,'input','e',[-6  6]);
fisMat=addvar(fisMat,'input','de',[-6  6]);
fisMat=addvar(fisMat,'output','u',[-3  3]);
fisMat=addmf(fisMat,'input',1,'NB','trapmf',[-6 -6 -5 -3]);
fisMat=addmf(fisMat,'input',1,'NS','trapmf',[-5 -3 -2 0]);
fisMat=addmf(fisMat,'input',1,'ZR','trimf',[-2 0 2]);
fisMat=addmf(fisMat,'input',1,'PS','trapmf',[0 2 3 5]);
fisMat=addmf(fisMat,'input',1,'PB','trapmf',[3 5 6 6]);
fisMat=addmf(fisMat,'input',2,'NB','trapmf',[-6 -6 -5 -3]);
fisMat=addmf(fisMat,'input',2,'NS','trapmf',[-5 -3 -2 0]);
fisMat=addmf(fisMat,'input',2,'ZR','trimf',[-2 0 2]);
fisMat=addmf(fisMat,'input',2,'PS','trapmf',[0 2 3 5]);
fisMat=addmf(fisMat,'input',2,'PB','trapmf',[3 5 6 6]);
fisMat=addmf(fisMat,'output',1,'NB','trapmf',[-3 -3 -2 -1]);
fisMat=addmf(fisMat,'output',1,'NS','trimf',[-2 -1 0]);
fisMat=addmf(fisMat,'output',1,'ZR','trimf',[-1 0 1]);
fisMat=addmf(fisMat,'output',1,'PS','trimf',[0 1 2]);
fisMat=addmf(fisMat,'output',1,'PB','trapmf',[1 2 3 3]);

rr=[5 5 4 4 3;5 4 4 3 3;4 4 3 3 2;4 3 3 2 2;3 3 2 2 1];
r1=zeros(prod(size(rr)),3);k=1;
for i=1:size(rr,1)
   for j=1:size(rr,2)
     r1(k,:)=[i,j,rr(i,j)];k=k+1;
   end
end
[r,s]=size(r1);r2=ones(r,2);rulelist=[r1 r2];
fisMat=addrule(fisMat,rulelist);

Ke=60;Kd=2.5;Ki=0.01;Ku=0.8;
x=[0;0];e=0;de=0;ie=0;
for k=1:N
		e1=Ke*e;de1=Kd*de;

if e1>=6;
		   e1=6;
		elseif e1<=-6
		   e1=-6;
		end
		if de1>=6;
		   de1=6;
		elseif de1<=-6
		   de1=-6;
		end

		in=[e1 de1];
		uu(1,k)=Ku*evalfis(in, fisMat)-Ki*ie;

		if k<=Nd;
		   u=0;
		else
		   u=uu(1,k-Nd);
		end

		if abs(u)<=Umin;
		   u=0;
		elseif abs(u)>Umax
		   u=sign(u)*Umax;
		end

		K1=A*x+b*u;K2=A*(x+h*K1/2)+b*u;
		K3=A*(x+h*K2/2)+b*u;K4=A*(x+h*K3)+b*u;
		x=x+(K1+2*K2+2*K3+K4)*h/6;
		y=c*x+d*u;yy1(1,k)=y;

		e1=e;e=y-R(1,k);de=(e-e1)/T;ie=e*T+ie;
end

Kp=5;Kd=0.001;Ki=0.1;
x=[0;0];e=0;de=0;ie=0;
for k=1:N

uu(1,k)=-(Kp*e+Ki*de+Kd*ie);

if k<=Nd;u=0;else u=uu(1,k-Nd);end

		if abs(u)<=Umin;u=0;elseif abs(u)>Umax;u=sign(u)*Umax;end

		K1=A*x+b*u;K2=A*(x+h*K1/2)+b*u;
		K3=A*(x+h*K2/2)+b*u;K4=A*(x+h*K3)+b*u;
		x=x+(K1+2*K2+2*K3+K4)*h/6;
		y=c*x+d*u;yy2(1,k)=y;

		e1=e;e=y-R(1,k);de=(e-e1)/T;ie=e*T+ie;
end

kk=[1:N]*T;
plot(kk,yy1,'k',kk,yy2,'--b',kk,R,'r');xlabel('时间');ylabel('输出');
legend('模糊控制', 'PID控制')
