%ex1_2.m
err_goal=0.001;lr=0.9; 
max_epoch=10000; 
X=input('根据书中例题输入参数X=');T=input('根据书中例题输入参数T=')
[M,N]=size(X);[L,N]=size(T);Wij=rand(L,M);y=0;b=rand(L);
for epoch=1:max_epoch 
NETi=Wij*X;
for j=1:N
  for i=1:L
    if (NETi(i,j)>=b(i))
        y(i,j)=1;
    else
        y(i,j)=0;
    end
  end
end
E=(T-y);EE=0;
for j=1:N
  EE=EE+abs(E(j));
end 
if (EE<err_goal) break;end
Wij=Wij+lr*E*X';        
b=b+sqrt(EE);       
end
epoch,Wij,b 
X1=X;       
NETi=Wij*X1; [M,N]=size(X1);
for j=1:N  
  for i=1:L
    if (NETi(i,j)>=b(i))
        y(i,j)=1;
    else
        y(i,j)=0;
    end
  end
end
y
