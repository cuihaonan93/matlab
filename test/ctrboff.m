%****���߼�������������ȵĹ���

%���������X  ��ģ���ݣ����� m*nά��mΪ����������nΪ����������
%          P  ���ؾ��󣨾��� n*Aά��nΪ����������AΪ��Ԫ������
%���������muc_off������ m*nά��mΪ����������nΪ����������
function muc_off=ctrboff(Lamday,PP,X)
[n,m]=size(X);
muc_off=zeros(n,m);
for i=1:n
 for j=1:m
    muc_off(i,j)=sqrt(norm(X(i,j)*PP(j,:)));%*sqrt(inv(Lamday))
 end
end