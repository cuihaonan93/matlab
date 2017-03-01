function [Ty,Qy,Py,Po,Pr]=TPLS(X0,Y0,e)
%TPLS--计算提取X，Y的主得分矩阵
%输入：X，Y，ｅ阈值
%输出：Ｔｙ直接与Ｙ相关的得分矩阵
%TPLS分解后，计算Ty*Py'以及Er分别与Y的相关性

%*******数据标准化处理***********
[n,m]=size(X0);
[X,xmean,xstd]=Stdz(X0);
[Y,ymean,ystd]=Stdz(Y0); 

%********PLS建模*************
%得出X的负载矩阵P，Y的负载矩阵Q，以及得分矩阵T
[~,~,P,Q,~,T]=neupls(X,Y);%[n,A]=size(X);
A=NumA(Y,T,Q,e);   %计算保留成分（潜变量）个数
[B,W,P,Q,R,T]=neupls(X,Y,A);%neupls是PLS建模程序
%*******PCA进一步分解**********
J=size(Y,2);
if J==1;
    Ty=T*Q';Ay=1;Qy=1;
else
    Ystar=T*Q';
    Ay=rank(Q);
    [Ty,Qy]=PCA(Ystar,Ay);  
end
Py=((T*P')'*Ty)/(Ty'*Ty);
Xo=T*P'-Ty*Py';
Ao=A-Ay;
[To,Po]=PCA(Xo,Ao);
E=X-T*P';
Ar=m-A;
[Tr,Pr]=PCA(E,Ar);
PP=R*Q'*Qy;
