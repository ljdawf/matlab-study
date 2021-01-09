%ex2_35.m
T=input('根据书中例题输入参数T=');

[w,b]=solvehop(T)

y=simuhop(T,w,b)                           
a=rands(2,1);y=simuhop(a,w,b,20);
plot(T(1,:),T(2,:),'r*');axis([-1.1 1.1 -1.1 1.1]);  
xlabel('T(1),a(1)');ylabel('T(2),a(2)');         
record=[cell2mat({a}) cell2mat({y})];   
start=cell2mat({a});
hold on; plot(start(1,1),start(2,1),'bx',record(1,:),record(2,:));

figure;color='rgbmy';
plot(T(1,:),T(2,:),'r*');axis([-1.1 1.1 -1.1 1.1]); 
xlabel('T(1),a(1)');ylabel('T(2),a(2)');hold on;
for i=1:10
a=rands(2,1);[y,yy]=simuhop(a,w,b,20);
plot(yy(1,1),yy(2,1),'kx',yy(1,:),yy(2,:),color(rem(i,5)+1));drawnow 
end;


