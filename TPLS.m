function [Ty,Qy,Py,Po,Pr]=TPLS(X0,Y0,e)
%TPLS--������ȡX��Y�����÷־���
%���룺X��Y������ֵ
%������ԣ�ֱ�������صĵ÷־���
%TPLS�ֽ�󣬼���Ty*Py'�Լ�Er�ֱ���Y�������

%*******���ݱ�׼������***********
[n,m]=size(X0);
[X,xmean,xstd]=Stdz(X0);
[Y,ymean,ystd]=Stdz(Y0); 

%********PLS��ģ*************
%�ó�X�ĸ��ؾ���P��Y�ĸ��ؾ���Q���Լ��÷־���T
[~,~,P,Q,~,T]=neupls(X,Y);%[n,A]=size(X);
A=NumA(Y,T,Q,e);   %���㱣���ɷ֣�Ǳ����������
[B,W,P,Q,R,T]=neupls(X,Y,A);%neupls��PLS��ģ����
%*******PCA��һ���ֽ�**********
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
