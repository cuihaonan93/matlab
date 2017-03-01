%对X按列进行标准化
%输入参数： X0建模数据（矩阵 m*n维，m为样本个数，n为变量个数）
%输出参数： X建模数据标准化后数据（矩阵 m*n维，m为样本个数，n为变量个数）
%          Xmean建模数据的均值
%          Xstd建模数据的标准差
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