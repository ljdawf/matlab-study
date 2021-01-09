%ex2_22_1.m
X0=[1 1 1;1 0 1;1 0 1;1 0 1;1 1 1];X1=[0 1 0;0 1 0;0 1 0;0 1 0; 0 1 0];
X2=[1 1 1;0 0 1;0 1 0;1 0 0;1 1 1]; X3=[1 1 1;0 0 1;0 1 0;0 0 1;1 1 1];
X4=[1 0 1;1 0 1;1 1 1;0 0 1;0 0 1]; X5=[1 1 1;1 0 0;1 1 1;0 0 1;1 1 1];
X6=[1 1 1;1 0 0;1 1 1;1 0 1;1 1 1]; X7=[1 1 1;0 0 1;0 0 1;0 0 1;0 0 1];
X8=[1 1 1;1 0 1;1 1 1;1 0 1;1 1 1]; X9=[1 1 1;1 0 1;1 1 1;0 0 1;1 1 1];
XA=[0 1 0;1 0 1;1 0 1;1 1 1;1 0 1]; XB=[1 1 1;1 0 1;1 1 0;1 0 1;1 1 1];
XC=[1 1 1;1 0 0;1 0 0;1 0 0;1 1 1]; XD=[1 1 1;1 0 1;1 0 1;1 0 1;1 1 0];
XE=[1 1 1;1 0 0;1 1 0;1 0 0;1 1 1]; XF=[1 1 1;1 0 0;1 1 0;1 0 0;1 0 0];
X=[X0(:) X1(:) X2(:) X3(:) X4(:) X5(:) X6(:) X7(:) X8(:) X9(:) ...
     XA(:) XB(:) XC(:) XD(:) XE(:) XF(:)];
T0=[0;0;0;0];T1=[0;0;0;1];T2=[0;0;1;0];T3=[0;0;1;1];
T4=[0;1;0;0];T5=[0;1;0;1];T6=[0;1;1;0];T7=[0;1;1;1];
T8=[1;0;0;0];T9=[1;0;0;1];TA=[1;0;1;0];TB=[1;0;1;1];
TC=[1;1;0;0];TD=[1;1;0;1];TE=[1;1;1;0];TF=[1;1;1;1]; 
T=input('根据书中例题输入参数T=') 
[R,N1]=size(X);[S2,N1]=size(T);S1=9;
[W1,b1,W2,b2]=initff(X,S1,'logsig',T,'logsig');
[y1,y2]=simuff(X,W1,b1,'logsig',W2,b2,'logsig');
disp_freq=20; max_epoch=5000;   
err_goal=0.0001; mc=0.95;          
tp=[disp_freq max_epoch err_goal NaN NaN NaN mc];
[W1,b1,W2,b2,te,tr]=trainbpx(W1,b1,'logsig',W2,b2,'logsig',X,T,tp);
[y1,y2]=simuff(X,W1,b1,'logsig',W2,b2,'logsig');
max_epoch=500; err_goal=0.6; 
T1=[T T T T];tp=[disp_freq  max_epoch  err_goal]
for i=1:10
X1=[X X (X+randn(R,N1)*0.1) (X+randn(R,N1)*0.2)];
[W1,b1,W2,b2,te,tr]=trainbpx(W1,b1,'logsig',W2,b2,'logsig',X1,T1,tp);
end
[y1,y2]=simuff(X1,W1,b1,'logsig',W2,b2,'logsig');
disp_freq=20; max_epoch=5000;err_goal=0.001; 
tp=[disp_freq max_epoch err_goal];
[W1,b1,W2,b2,te,tr]=trainbpx(W1,b1,'logsig',W2,b2,'logsig',X,T,tp);
X1=X(:,2:2:16);               
y=simuff(X1,W1,b1,'logsig',W2,b2,'logsig')
