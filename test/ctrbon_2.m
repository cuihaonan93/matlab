%**********评价诊断方法一：直接计算变量对隶属度的贡献******************88

%在线计算每个变量对隶属度mu的贡献
%输入参数：Xnew 在线数据（行向量1*m维，m为变量个数）
%          P    负载矩阵（矩阵 m*A维，m为变量个数，A为主元个数）
%输出参数：muc  每个变量的在线贡献值（行向量1*m维，m为变量个数）
function muc=ctrbon_2(PP,Xnew,ctrblimit)
[n,m]=size(Xnew);
muc=zeros(n,m);
%计算第j个变量对隶属度在线贡献
 for j=1:m
    muc(j)=sqrt(norm(Xnew(j)*PP(j,:)))/ctrblimit(j);%*sqrt(inv(Lamday))
 end
 