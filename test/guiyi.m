function [ sx ] = guiyi( x )
%对X按列进行归一化
[n,m]=size(x);
sx=zeros(n,m);
for j=1:m;
    if (max(x(:,j)) - min(x(:,j)))==0;
        sx(:,j)=0;
    else
       sx(:,j)=(x(:,j)-min(x(:,j)))/(max(x(:,j)) - min(x(:,j)));
    end;
end

end

