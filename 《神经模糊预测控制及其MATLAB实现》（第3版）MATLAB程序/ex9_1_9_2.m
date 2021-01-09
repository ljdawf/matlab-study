%ex9_1/9_2.m
clear;disp('单变量最小相位系统的隐式广义预测控制算法的研究')
d0=input('仿真例9-1请输入1；仿真例9-2请输入2：');
disp('广义预测控制算法初始值')
nn=input('时域长度p=');n=input('预测长度n=');m=input('控制长度m=');
t0=input('控制加权系数λ=');a=input('柔化系数α=');
disp('最小二乘公式初始值')
t1=1;                         
d1=0;d2=0;d3=0;
d1=input('(n+1)阶方阵P的形式：设置为方阵请输入1；否则按回车键将自动设置为对角阵:');
d2=input('(n+1)阶方阵P的初始值：键盘设置请输入1；否则按回车键自动赋值为1e+5:');
if (d1==1)
    if (d2==1)
        P=input('在方括号[ ]中,输入(n+1)阶方阵P的值:');
    else
        P=(1e+5)*ones(n+1);
    end
else
    if (d2==1)
        PP=input('在方括号[ ]中,输入(n+1)阶对角方阵P对角线上的值:');
        P=diag(PP);
    else
        P=(1e+5)*eye(n+1);
    end
end

uuu=0;yyy=0;uu=zeros(n,1);u=zeros(m,1);yy=zeros(n,1);y1=zeros(n,1);
Q=zeros(n+1,1);Q(1,1)=1;Q(n+1,1)=1;

T=300;[yr0,t]=gensig('square',100,T,1);
d3=input('输出曲线是否去掉前100步:去掉时请输入1；否则按回车键:');
nm=length(t);                   
for ij=2:nm
    yr=yr0(ij)+1;   
    if (d0==1)
      y=1.496585*yy(n,1)-0.496585*yy(n-1,1)+0.5*uu(n-1,1);               
    else
      y=2.001676*yy(n,1)-1.24339*yy(n-1,1)+0.24171*yy(n-2,1)+0.23589*uu(n,1); 
    end

    a9=0;
    for i=1:1
        a9=a9+rand;
    end
    a8=0.01*(a9-6);         

    for i=1:n-1
        yy(i,1)=yy(i+1,1);
    end
    yy(n,1)=y;
    yyy=[yyy;y];                     

    for i=1:n
        X(1,i)=uu(i,1);
    end
    X(1,n+1)=1;K=P*X'*inv(t1+X*P*X');P=(eye(n+1)-K*X)*P/t1; Q=Q+K*(y-X*Q);

    for j=1:m
        for i=n:-1:j
            i1=n-i+j; G(i1,j)=Q(i,1);
        end
    end

    y0(1:nn-1,1)=y1(2:nn,1);y0(nn,1)=y1(nn,1); y0=y0+(y-y1(1,1));
    for i=1:n
        y1(i,1)=y0(i,1)+u(1,1)*Q(n+1-i,1);
    end
    for i=n+1:nn
        y1(i,1)=y1(n,1);
    end

    f(1:n,1)=y0(1:n,1);

    w=a*y+(1-a)*yr;
    for i=2:n
        w=[w;a^i*y+(1-a^i)*yr];
    end

    u=inv(G'*G+t0*eye(m))*G'*(w-f);

    for i=1:n-1
        uu(i,1)=uu(i+1,1);
    end
    uu(n,1)=u(1,1);
    uuu=[uuu;u(1,1)];              

    if(u(1,1)>1)
        u(1,1)=1;
    end
    if(u(1,1)<-1)
        u(1,1)=-1;
    end
end

if (d3==1)
    yyy1(1:(T-100),1)=yyy(101:T,1);uuu1(1:(T-100),1)=uuu(101:T,1);
    t1(1:(T-100),1)=t(101:T,1)-100;yr01(1:(T-100),1)=yr0(101:T,1);
    subplot(2,1,1):plot(t1,(yr01+1),t1,yyy1);axis([0,nm-100,0,2.5]);xlabel('t');ylabel('yr,y')
    subplot(2,1,2):plot(t1,uuu1);axis([0,nm-100,-1.5,1.5]);xlabel('t');ylabel('u')
else
    subplot(2,1,1):plot(t,(yr0+1),t,yyy); axis([0,nm,0,2.5]);xlabel('t');ylabel('yr,y')
    subplot(2,1,2):plot(t,uuu); axis([0,nm,-1.5,1.5]);xlabel('t');ylabel('u')
end
