%**********���߼���ÿ�������������ȹ��׵Ŀ�����*********

%���������m ��ģ���ݱ�������
%          A ��Ԫ����
%          muc_off �������Ĺ���ֵ������ n*mά��nΪ����������mΪ����������
%          alpha  ���Ŷȣ�����99%,95%��
%���������uplimit ���ޣ�������1*mά��mΪ����������
function uplimit=ctrblmt(A,muc_off,alpha)
m=size(muc_off,2);
uplimit=[];
for j=1:m
    [mu,sig]=normfit(muc_off(:,j),1-alpha);
    tu=(A*(m-1)/(m-A))*norminv(1-(1-alpha)/2,mu,sig);
    uplimit=[uplimit tu];
end