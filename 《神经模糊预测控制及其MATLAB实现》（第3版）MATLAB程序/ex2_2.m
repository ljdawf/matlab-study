%ex2_2.m
err_goal=0.001;                    
max_epoch=500;                  
X=input('根据书中例题输入参数X=');T=input('根据书中例题输入参数T=')    
[M,N]=size(X);[L,N]=size(T);
Wij=rand(L,M);b1=zeros(L,1);      
for epoch=1:max_epoch
    y=hardlim(Wij*X,b1);          
    E=T-y;                       
    SSE=mae(E);                  
    if (SSE<err_goal) break;end
    Wij=Wij+E*X';               
    b1=b1+E;                    
end
epoch, Wij                        
X1=X;   
y=hardlim(Wij*X1,b1)
          
