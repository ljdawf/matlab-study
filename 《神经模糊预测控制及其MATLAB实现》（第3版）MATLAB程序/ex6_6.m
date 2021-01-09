%ex6_6.m
data=rand(100,2);plot(data(:,1),data(:,2),'o');[center,U,obj_fcn]=fcm(data,3); 
maxU=max(U);index1=find(U(1,:)==maxU);
index2=find(U(2,:)==maxU);index3=find(U(3,:)==maxU);
figure;line(data(index1,1),data(index1,2) ,'linestyle','*','color','k'); 
line(data(index2,1),data(index2,2) ,'linestyle','o','color','r'); 
line(data(index3,1),data(index3,2) ,'linestyle','x','color','b'); 
hold on; title('模糊C-均值聚类');
plot(center(1,1),center(1,2),'ko','markersize',10,'LineWidth',1.5);
plot(center(2,1),center(2,2),'ksquare','markersize',10,'LineWidth',1.5);
plot(center(3,1),center(3,2),'kd','markersize',10,'LineWidth',1.5);




