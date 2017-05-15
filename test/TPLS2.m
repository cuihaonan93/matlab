%T-PLS算法

function [B,W,P,Q,R,xmean,xstd,ymean,ystd,Ty,Qy,Py,Po,Pr,ctrblimit,Lamday,PP]=TPLS2(X0,Y0,e,percent,alpha)
%%TPLS分解后，计算Ty*Py'以及Er分别与Y的相关性

%需要事先给定X,Y,e,例如：
% X0=rand(200,6);
% Y0=rand(200,1);
% e=0.01;

%*******数据标准化处理***********
[n,m]=size(X0);
xmean=mean(X0);
xstd=std(X0);
X=standard(X0);
ymean=mean(Y0);
ystd=std(Y0);
Y=standard(Y0); 

%********建模*************
[~,~,~,Q,~,T]=neupls(X,Y);%[n,A]=size(X);
A=NumA(Y,T,Q,e);
[B,W,P,Q,R,T]=neupls(X,Y,A);%neupls是PLS建模程序
%*******PCA进一步分解**********
J=size(Y,2);
if J==1;
    Ty=T*Q';Ay=1;Qy=1;
else
    Ystar=T*Q';
    Ay=rank(Q);
    [Ty,Qy]=PCAOffmodel(Ystar,Ay);  
end
% X1=T*Q';
% Ay=rank(Q);
% [Ty,Qy]=PCAOffmodel(X1,Ay);
Py=((T*P')'*Ty)/(Ty'*Ty);
Xo=T*P'-Ty*Py';
Ao=A-Ay;
[To,Po]=PCAOffmodel(Xo,Ao);
E=X-T*P';
Ar=m-A;
[Tr,Pr]=PCAOffmodel2(E,percent,Ar);
% Er=E-Tr*Pr';
% %*******计算相关性*************
% F=Ty*Py';
% r1=correlation(F,Ty);
% r2=correlation(Er,Ty);
% r=[r1,r2];
%******计算各变量对隶属度的贡献************ 
Lamday=1/(n-1)*((Ty)'*Ty);
PP=R*Q'*Qy;
muc_off=ctrboff(Lamday,PP,X);
%*****计算各变量对隶属度贡献的控制限*******
ctrblimit=ctrblmt(Ay,muc_off,alpha);