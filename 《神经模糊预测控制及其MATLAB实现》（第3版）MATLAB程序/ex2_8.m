%ex2_8.m
err_goal=0.001;max_epoch=1000;    
X=input('�������������������X=');T=input('�������������������T=')
[W,b]=initp(X,T); 
for epoch=1:max_epoch
y=simup(X,W,b);
E=T-y;SSE=mae(E);           
if (SSE<err_goal) break;end
[dW,db]=learnp(X,E);            
W=W+dW;b=b+db;      
end
epoch,W,y 
            
