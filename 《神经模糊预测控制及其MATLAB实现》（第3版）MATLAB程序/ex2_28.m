%ex2_28.m
X=input('根据书中例题输入参数X=');
plot(X(1,:),X(2,:),'+r');xlabel('X(1)') ;ylabel('X(2)')
w=initsm(X,30);m=nbman(5,6);
figure;plotsom(w,m)                 
df=20;                            
me=100;                          
lr=0.1;                            
tp=[df me lr];w=trainsm(w,m,X,tp)
 
X1=[0.5;0.3];Y=simusm(X1,w,m)
