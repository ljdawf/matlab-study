%ex2_13.m
X=input('根据书中例题输入参数X=');T=input('根据书中例题输入参数T=')          
[W,b]=solvelin(X,T);
y=simulin(X,W,b)
