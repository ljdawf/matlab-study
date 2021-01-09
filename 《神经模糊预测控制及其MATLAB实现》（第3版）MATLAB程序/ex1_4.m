%ex1_4.m
lr=0.05;err_goal=0.001; 
max_epoch=10000;a=0.9; 
Oi=0;Ok=0;                
X=input('根据书中例题输入参数X=');T=input('根据书中例题输入参数T=')
[M,N]=size(X);q=8;[L,N]=size(T); 
Wij=rand(q,M);Wki=rand(L,q);Wij0=zeros(size(Wij));Wki0=zeros(size(Wki));
for epoch=1:max_epoch
NETi=Wij*X;
for j=1:N
  for i=1:q
    Oi(i,j)=2/(1+exp(-NETi(i,j)))-1;
  end
end
NETk=Wki*Oi;
for i=1:N
  for k=1:L
    Ok(k,i)=2/(1+exp(-NETk(k,i)))-1;
  end
end
E=((T-Ok)'*(T-Ok))/2;
if (E<err_goal) break;end
deltak=Ok.*(1-Ok).*(T-Ok);W=Wki;
Wki=Wki+lr*deltak*Oi'+a*(Wki-Wki0);Wki0=W;
deltai=Oi.*(1-Oi).*(deltak'*Wki)';W=Wij;
Wij=Wij+lr*deltai*X'+a*(Wij-Wij0);Wij0=W;
end
epoch  
X1=X;       
NETi=Wij*X1;
for j=1:N 
  for i=1:q
    Oi(i,j)=2/(1+exp(-NETi(i,j)))-1;
  end
end
NETk=Wki*Oi;
for i=1:N
  for k=1:L
    Ok(k,i)=2/(1+exp(-NETk(k,i)))-1;
  end
end
Ok
