%ex2_17.m
Time1=0:0.05:4;Time2=4.05:0.024:6;Time=[Time1 Time2];
T=input('根据书中例题输入参数T=');plot(Time,T);X=T;
Id=[1 2 3 4 5]; lr=0.1;net=newlin(minmax(X),1,Id,lr);  
[net,e,y]=adapt(net,X,T);   
figure;plot(Time,y,Time,X,'x',Time,e,'o'); 
             

