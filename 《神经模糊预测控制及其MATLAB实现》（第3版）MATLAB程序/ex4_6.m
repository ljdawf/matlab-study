%ex4_6
X=[0.8 0.6 0.2]';Y=[0.2 0.4 0.7 1];
Z=zeros(size(X,1),size(Y,2));
for i=1:size(X,1)
    for j=1:size(Y,2)
        Z(i,j)=max(min(X(i,:),Y(:,j)'));
    end
end
Z
