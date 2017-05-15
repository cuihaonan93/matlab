function [ result ] = ctrbon( PP,Xnew,ctrblimit )
%计算整个在线数据的贡献量，每个时刻计算，均值
[n,m]=size(Xnew);
result1=zeros(n,m);
for j=1:m
    result1(j,:) = ctrbon_2(PP,Xnew(j,:),ctrblimit);
 end
result = mean(result1);
end

