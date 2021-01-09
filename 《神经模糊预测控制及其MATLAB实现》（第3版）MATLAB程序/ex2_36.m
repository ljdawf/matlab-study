%ex2_36.m
T=input('根据书中例题输入参数T=');
[w,b]=solvehop(T)                                
y=simuhop(T,w,b)
a=rands(3,1);[y,yy]=simuhop(a,w,b,20); 
figure;axis([-1 1 -1 1 -1 1]); 
set(gca,'box','on'); axis manual;       
hold on; plot3(T(1,:),T(2,:),T(3,:),'r*');
hold on; plot3(yy(1,1),yy(2,1),yy(3,1),'bx',yy(1,:),yy(2,:),yy(3,:));
xlabel('T(1),a(1)'); ylabel('T(2),a(2)'); zlabel('T(3),a(3)');view([37.5 30]);
figure;color='rgbmy'; 
axis([-1 1 -1 1 -1 1]);set(gca,'box','on');
xlabel('T(1),a(1)'); ylabel('T(2),a(2)');zlabel('T(3),a(3)');view([37.5 30]); 
axis manual;hold on;plot3(T(1,:) ,T(2,:),T(3,:),'r*');hold on; 
for i=1:10
a=rands(3,1);[y,yy]=simuhop(a,w,b,20); 
plot3(yy(1,1),yy(2,1),yy(3,1),'kx',yy(1,:),yy(2,:),yy(3,:),color(rem(i,5)+1));
drawnow 
end; 
