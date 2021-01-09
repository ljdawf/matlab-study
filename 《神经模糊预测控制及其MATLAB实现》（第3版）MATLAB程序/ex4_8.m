%ex4_8
A1=[1 0.5 0]';B1=[1 0.6 0.2];C1=[1 0.4 0];
A2=[0 0.5 1]';B2=[0.2 0.6 1];C2=[0 0.4 1];
Aa=[0.5 1 0.5]';
Bb=input('根据书中例题输入参数Bb=');
Rr1=zeros(size(A1,1),size(B1,2));
for i=1:size(A1,1)
    for j=1:size(B1,2)
        Rr1(i,j)=max(min(A1(i,:),B1(:,j)'));
    end
end
Rr1=Rr1';
Rr1=Rr1(:);
R1=zeros(size(Rr1,1),size(C1,2));
for i=1:size(Rr1,1)
    for j=1:size(C1,2)
        R1(i,j)=max(min(Rr1(i,:),C1(:,j)'));
    end
end
R1

Rr2=zeros(size(A2,1),size(B2,2));
for i=1:size(A2,1)
    for j=1:size(B2,2)
        Rr2(i,j)=max(min(A2(i,:),B2(:,j)'));
    end
end
Rr2=Rr2';
Rr2=Rr2(:);
R2=zeros(size(Rr2,1),size(C2,2));
for i=1:size(Rr2,1)
    for j=1:size(C2,2)
        R2(i,j)=max(min(Rr2(i,:),C2(:,j)'));
    end
end
R2

R=max(R1,R2)

Ra=zeros(size(Aa,1),size(Bb,2));
for i=1:size(Aa,1)
    for j=1:size(Bb,2)
        Ra(i,j)=max(min(Aa(i,:),Bb(:,j)'));
    end
end
Ra=Ra';
Ra=Ra(:);
Ra=Ra'

Cc=zeros(size(Ra,1),size(R,2));
for i=1:size(Ra,1)
    for j=1:size(R,2)
        Cc(i,j)=max(min(Ra(i,:),R(:,j)'));
    end
end
Cc
