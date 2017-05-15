%T-PLS�㷨

function [B,W,P,Q,R,xmean,xstd,ymean,ystd,Ty,Qy,Py,Po,Pr,ctrblimit,Lamday,PP]=TPLS2(X0,Y0,e,percent,alpha)
%%TPLS�ֽ�󣬼���Ty*Py'�Լ�Er�ֱ���Y�������

%��Ҫ���ȸ���X,Y,e,���磺
% X0=rand(200,6);
% Y0=rand(200,1);
% e=0.01;

%*******���ݱ�׼������***********
[n,m]=size(X0);
xmean=mean(X0);
xstd=std(X0);
X=standard(X0);
ymean=mean(Y0);
ystd=std(Y0);
Y=standard(Y0); 

%********��ģ*************
[~,~,~,Q,~,T]=neupls(X,Y);%[n,A]=size(X);
A=NumA(Y,T,Q,e);
[B,W,P,Q,R,T]=neupls(X,Y,A);%neupls��PLS��ģ����
%*******PCA��һ���ֽ�**********
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
% %*******���������*************
% F=Ty*Py';
% r1=correlation(F,Ty);
% r2=correlation(Er,Ty);
% r=[r1,r2];
%******����������������ȵĹ���************ 
Lamday=1/(n-1)*((Ty)'*Ty);
PP=R*Q'*Qy;
muc_off=ctrboff(Lamday,PP,X);
%*****����������������ȹ��׵Ŀ�����*******
ctrblimit=ctrblmt(Ay,muc_off,alpha);