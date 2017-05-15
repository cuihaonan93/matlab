function [Ty,Qy,Py,Po,Pr,PP,ctrblimit]=TPLS(X,Y,e,alpha)
%TPLS--计算提取X，Y的主得分矩阵
%输入：X，Y，ｅ阈值
%输出：Ｔｙ直接与Ｙ相关的得分矩阵
%TPLS分解后，计算Ty*Py'以及Er分别与Y的相关性

%********PLS建模*************
%得出X的负载矩阵P，Y的负载矩阵Q，以及得分矩阵T
[~,~,~,Q,~,T]=neupls(X,Y);%[n,A]=size(X);
A=NumA(Y,T,Q,e);   %计算保留成分（潜变量）个数
[B,W,P,Q,R,T]=neupls(X,Y,A);%neupls是PLS建模程序
[n,m]=size(X);

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
%******计算各变量对隶属度的贡献************ 
Lamday=1/(n-1)*((Ty)'*Ty);
PP=R*Q'*Qy;
muc_off=ctrboff(Lamday,PP,X);
%*****计算各变量对隶属度贡献的控制限*******
ctrblimit=ctrblmt(Ay,muc_off,alpha);
