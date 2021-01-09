%ex6_2.m
x=0:0.1:10;y=sin(2*x)./exp(x/5); trnData=[x' y']; 
numMFs=5;mfType='gbellmf';              
initFis=genfis1(trnData,numMFs,mfType);     
epoch_n=20;                          
fisMat=anfis(trnData,initFis,epoch_n);      
plot(x,y,'-',x,evalfis(x,fisMat),':'); 
legend('Training Data','ANFIS Output')

 

