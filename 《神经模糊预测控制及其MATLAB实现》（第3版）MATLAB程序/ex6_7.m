%ex6_7.m
X=input('根据书中例题输入参数X=');plot(X(:,1),X(:,2),'+');radii=0.3;[C,S]=subclust(X,radii);
N=length(C);hold on; 
for i=1:N;plot(C(i,1),C(i,2),'ko','markersize',10,'LineWidth',1.5);end
title('模糊减法聚类(radii=0.3)');




