function [ data ] = stdon( x,xmean,xstd )
%利用离线数据的均值与标准差，标准化在线数据。
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

