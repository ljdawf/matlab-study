%ex6_3.m
numPts=input('根据书中例题输入参数numPts=');                               
x=linspace(-1,1,numPts);                      
y=0.5*sin(pi*x)+0.3*sin(3*pi*x)+0.1*sin(5*pi*x);  
data=[x' y'];                                 
trnData=data(1:2:numPts,:);                  
chkData=data(2:2:numPts,:);                   

subplot(2,2,1);plot(trnData(:,1),trnData(:,2),'o',chkData(:,1),chkData(:,2),'x');
legend('训练数据','检验数据');title('训练和检验数据的分布曲线');xlabel('(1)');

numMFs=5; mfType='gbellmf';                  
fisMat=genfis1(trnData,numMFs,mfType);        

subplot(2,2,2);[x1,mf]=plotmf(fisMat,'input',1);
plot(x1,mf); title('系统训练前的隶属度函数');xlabel('(2)');

epochs=40;                             
trnOpt=[epochs NaN NaN NaN NaN];dispOpt=[ ];
[Fis,error,stepsize,chkFis,chkEr]=anfis(trnData,fisMat,trnOpt,dispOpt,chkData)

subplot(2,2,3);[x1,mf]=plotmf(Fis,'input',1);   
plot(x1,mf); title('系统训练后的隶属度函数');xlabel('(3)');

trnOut1=evalfis(trnData(:,1),Fis);          
trnOut2=evalfis(trnData(:,1),chkFis);   
trnRMSE1=norm(trnOut1-trnData(:,2))/sqrt(length(trnOut1))
trnRMSE2=norm(trnOut2-trnData(:,2))/sqrt(length(trnOut2))
anfis_y1=evalfis(x,Fis);anfis_y2=evalfis(x,chkFis);
subplot(2,2,4);plot(x,y,'-',x,anfis_y1,'x',x,anfis_y2,'o');
title('函数输出和ANFIS系统输出'); xlabel('(4)');
legend('原函数的输出','ANFIS-1的输出','ANFIS-2的输出')
writefis(Fis,'ex6_3');
