function [ data ] = stdon( x,xmean,xstd )
%�����������ݵľ�ֵ���׼���׼���������ݡ�
[n,m]=size(x);
data=zeros(n,m);
for j=1:m;
    if xstd==0;
        data(:,j)=0;
    else
       data(:,j)=(x(:,j)-xmean(j))/xstd(j);
    end;
end


end

