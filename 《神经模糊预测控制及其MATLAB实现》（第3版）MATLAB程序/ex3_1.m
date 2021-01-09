%ex3_1.m 
clear all;close all;
d1=3;d2=1.2;                         
lr=0.1;a=0.05;  
nm=300;                 
y0=0;u0=9;                  
M=input('根据书中例题输入参数M=');L=input('根据书中例题输入参数L=') ;q=5;                      
Wij=rands(q,M);                 
Wki=rands(L,q);                
Wij0=zeros(size(Wij));Wki0=zeros(size(Wki));
[r,t1]=gensig('square',100,nm,1);  
yr(1:nm+1)=r(1:nm+1)*(14.7-12.0)+12.0;t(1:nm)=t1(1:nm);           
for k=1:nm                            
    y(k)=0.2*sin(y0)+3.5*(9-u0);     
    if k==120
       y(k)=y(k)+d1;       
    elseif k==180   
        y(k)=y(k)+d2;        
    end
    neti=Wij*y(k);              
    for j=1:q
       Oi(j)=(1-exp(-neti(j)))/(1+exp(-neti(j))); 
    end
    Ok=Wki*Oi';                       
    u(k)=9-(yr(k+1)-Ok)/3.5;            
    y1(k)=0.2*sin(y(k))+3.5*(9-u(k));      
    u0=u(k); y0=y(k);  
    e(k+1)=y1(k)-yr(k+1);               
    for i=1:q
        dWki=lr*e(k+1)*Oi(i);
    end
    Wki1=Wki+dWki+a*(Wki-Wki0); 
    Wki0=Wki;Wki=Wki1;
    for i=1:q
        dfi(i)=2*(exp(-neti(i)))/(exp(-neti(i))+1)^2;
    end
    dWij=lr*e(k+1)*dfi*Wki'*y(k);
    Wij1=Wij+dWij+a*(Wij-Wij0);     
    Wij0=Wij;Wij=Wij1; 
end
subplot(2,1,1);plot(t,yr(1:nm),'r',t,y,'b');xlabel('t/(步)');ylabel('yr,y');
subplot(2,1,2):plot(t,u);xlabel('t/(步)');ylabel('u/(ms)');
