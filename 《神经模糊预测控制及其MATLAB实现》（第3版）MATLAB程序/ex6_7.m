%ex6_7.m
X=input('�������������������X=');plot(X(:,1),X(:,2),'+');radii=0.3;[C,S]=subclust(X,radii);
N=length(C);hold on; 
for i=1:N;plot(C(i,1),C(i,2),'ko','markersize',10,'LineWidth',1.5);end
title('ģ����������(radii=0.3)');




