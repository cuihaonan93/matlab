function [ result ] = ctrbon( PP,Xnew,ctrblimit )
%���������������ݵĹ�������ÿ��ʱ�̼��㣬��ֵ
[n,m]=size(Xnew);
result1=zeros(n,m);
for j=1:m
    result1(j,:) = ctrbon_2(PP,Xnew(j,:),ctrblimit);
 end
result = mean(result1);
end

