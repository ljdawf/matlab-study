%ex2_25.m

C=[0 1;0 1];clusters=5;points=6;std_dev=0.05;
X=nngenc(C,clusters,points,std_dev);
plot(X(1,:),X(2,:),'+r');xlabel('X(1)') ;ylabel('X(2)')

w=initc([0 1;0 1],5);
figure;plot(X(1,:),X(2,:),'+r',w(:,1),w(:,2),'ow');
xlabel('X(1),w(1)') ;ylabel('X(2),w(2)')

df=20;               
me=500;              
lr=0.1;                  
tp=[df me lr];w=trainc(w,X,tp);                   
X1=[0;0.2];y=simuc(X1,w)
