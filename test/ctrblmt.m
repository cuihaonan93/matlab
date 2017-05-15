%**********离线计算每个变量对隶属度贡献的控制限*********

%输入参数：m 建模数据变量个数
%          A 主元个数
%          muc_off 各变量的贡献值（矩阵 n*m维，n为样本个数，m为变量个数）
%          alpha  置信度（例如99%,95%）
%输出参数：uplimit 上限（行向量1*m维，m为变量个数）
function uplimit=ctrblmt(A,muc_off,alpha)
m=size(muc_off,2);
uplimit=[];
for j=1:m
    [mu,sig]=normfit(muc_off(:,j),1-alpha);
    tu=(A*(m-1)/(m-A))*norminv(1-(1-alpha)/2,mu,sig);
    uplimit=[uplimit tu];
end