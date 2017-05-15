%输入参数： X建模数据（矩阵 m*n维，m为样本个数，n为变量个数）
%          percent累计贡献率的下限（一个百分数）
%输出参数： T得分矩阵（矩阵 m*A维，m为样本个数，A为主元个数）
%          P负载矩阵（矩阵 n*A维，n为变量个数，A为主元个数）
%          A主元个数
%          S与得分向量对应的特征值矩阵（矩阵 A*A维，A为主元个数）
%          Xstar是X的估计值（矩阵 m*n维，m为样本个数，n为变量个数）
function [T,P,S,Xstar]=PCA(X0,A)
[X,~,~] = Stdz(X0);
[~,n]=size(X);
P=[];%T=[];
V=cov(X);                    % 计算x的协方差矩阵
[vec0,val0]=eig(V);          %求特征值与特征向量
val=fliplr(diag(val0)');     %将特征值按照从大到小的顺序排列
vec=fliplr(vec0);            %调整特征向量的顺序，使之与特征值相对应

% p=sum(val);                 % 利用累计贡献率计算保留主元个数A
% for i=1:n
%     q=sum(val(1,1:i));
%     if (q/p>=percent)
%         A=i;
%         break
%     end
% end
S=diag(val(1,1:A));
P=[P vec(:,1:A)];
T=X*P;
Xstar=T*P';
return;