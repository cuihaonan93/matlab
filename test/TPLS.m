function [Ty,Qy,Py,Po,Pr,PP,ctrblimit]=TPLS(X,Y,e,alpha)
%TPLS--������ȡX��Y�����÷־���
%���룺X��Y������ֵ
%������ԣ�ֱ�������صĵ÷־���
%TPLS�ֽ�󣬼���Ty*Py'�Լ�Er�ֱ���Y�������

%********PLS��ģ*************
%�ó�X�ĸ��ؾ���P��Y�ĸ��ؾ���Q���Լ��÷־���T
[~,~,~,Q,~,T]=neupls(X,Y);%[n,A]=size(X);
A=NumA(Y,T,Q,e);   %���㱣���ɷ֣�Ǳ����������
[B,W,P,Q,R,T]=neupls(X,Y,A);%neupls��PLS��ģ����
[n,m]=size(X);

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
%******����������������ȵĹ���************ 
Lamday=1/(n-1)*((Ty)'*Ty);
PP=R*Q'*Qy;
muc_off=ctrboff(Lamday,PP,X);
%*****����������������ȹ��׵Ŀ�����*******
ctrblimit=ctrblmt(Ay,muc_off,alpha);
