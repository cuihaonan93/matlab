%��X���н��б�׼��
%��������� X0��ģ���ݣ����� m*nά��mΪ����������nΪ����������
%��������� X��ģ���ݱ�׼�������ݣ����� m*nά��mΪ����������nΪ����������
%          Xmean��ģ���ݵľ�ֵ
%          Xstd��ģ���ݵı�׼��
function [X,Xmean,Xstd]=Stdz(X0)             
[m,n]=size(X0);
X=zeros(m,n);
Xmean=zeros(1,n);
Xstd=zeros(1,n);
for j=1:n;
    if std(X0(:,j))==0;
       X(:,j)=0;
    else
       X(:,j)=(X0(:,j)-mean(X0(:,j)))./std(X0(:,j));
    end
    Xmean(1,j)=mean(X0(:,j));
    Xstd(1,j)=std(X0(:,j));
end