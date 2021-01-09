%ex6_3.m
numPts=input('�������������������numPts=');                               
x=linspace(-1,1,numPts);                      
y=0.5*sin(pi*x)+0.3*sin(3*pi*x)+0.1*sin(5*pi*x);  
data=[x' y'];                                 
trnData=data(1:2:numPts,:);                  
chkData=data(2:2:numPts,:);                   

subplot(2,2,1);plot(trnData(:,1),trnData(:,2),'o',chkData(:,1),chkData(:,2),'x');
legend('ѵ������','��������');title('ѵ���ͼ������ݵķֲ�����');xlabel('(1)');

numMFs=5; mfType='gbellmf';                  
fisMat=genfis1(trnData,numMFs,mfType);        

subplot(2,2,2);[x1,mf]=plotmf(fisMat,'input',1);
plot(x1,mf); title('ϵͳѵ��ǰ�������Ⱥ���');xlabel('(2)');

epochs=40;                             
trnOpt=[epochs NaN NaN NaN NaN];dispOpt=[ ];
[Fis,error,stepsize,chkFis,chkEr]=anfis(trnData,fisMat,trnOpt,dispOpt,chkData)

subplot(2,2,3);[x1,mf]=plotmf(Fis,'input',1);   
plot(x1,mf); title('ϵͳѵ����������Ⱥ���');xlabel('(3)');

trnOut1=evalfis(trnData(:,1),Fis);          
trnOut2=evalfis(trnData(:,1),chkFis);   
trnRMSE1=norm(trnOut1-trnData(:,2))/sqrt(length(trnOut1))
trnRMSE2=norm(trnOut2-trnData(:,2))/sqrt(length(trnOut2))
anfis_y1=evalfis(x,Fis);anfis_y2=evalfis(x,chkFis);
subplot(2,2,4);plot(x,y,'-',x,anfis_y1,'x',x,anfis_y2,'o');
title('���������ANFISϵͳ���'); xlabel('(4)');
legend('ԭ���������','ANFIS-1�����','ANFIS-2�����')
writefis(Fis,'ex6_3');
