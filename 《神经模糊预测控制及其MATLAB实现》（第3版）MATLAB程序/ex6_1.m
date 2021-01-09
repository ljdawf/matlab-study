%ex6_1.m
data=[rand(10,1) 10*rand(10,1)-5 rand(10,1)];   
numMFs=[3  7];               
mfType=str2mat('pimf','trimf');   
fisMat=genfis1(data,numMFs,mfType);      
subplot(2,1,1);plotmf(fisMat,'input',1);
subplot(2,1,2);plotmf(fisMat,'input',2);


