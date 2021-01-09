%ex2_30.m
X=input('根据书中例题输入参数X=');
C=[1 1 1 2 2 2 2 1 1 1];T=ind2vec(C); plotvec(X,C);
S1=4; [W1,W2]=initlvq(X,S1,T)
figure;plotvec(X,C); hold on;
xlabel('X(1),w(1)');ylabel('X(2),w(2)'); hold off;
disp_freq=20; max_cycle=500; 
lr=0.05; tp=[disp_freq  max_cycle  lr]; 
[W1,W2]=trainlvq(W1,W2,X,T,tp);                     
X1=[0.8;0.3];y2=simulvq(X1,W1,W2) 
y=vec2ind(y2)                                     
yy=full(y2)

