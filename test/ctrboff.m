%****离线计算变量对隶属度的贡献

%输入参数：X  建模数据（矩阵 m*n维，m为样本个数，n为变量个数）
%          P  负载矩阵（矩阵 n*A维，n为变量个数，A为主元个数）
%输出参数：muc_off（矩阵 m*n维，m为样本个数，n为变量个数）
function muc_off=ctrboff(Lamday,PP,X)
[n,m]=size(X);
muc_off=zeros(n,m);
for i=1:n
 for j=1:m
    muc_off(i,j)=sqrt(norm(X(i,j)*PP(j,:)));%*sqrt(inv(Lamday))
 end
end