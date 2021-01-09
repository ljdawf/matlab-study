%ex4_5
R=[0.8 0.3;0.3 0.6];S=[0.7 0.5;0.1 0.1];
T=zeros(size(R,1),size(S,2));
for i=1:size(R,1)
    for j=1:size(T,2)
        T(i,j)=max(min(R(i,:),S(:,j)'));
    end
end
T