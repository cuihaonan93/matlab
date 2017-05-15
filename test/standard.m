function sx=standard(x)             
%对X按列进行标准化
[n,m]=size(x);
sx=zeros(n,m);
for j=1:m;
    if std(x(:,j))==0;
        sx(:,j)=0;
    else
       sx(:,j)=(x(:,j)-mean(x(:,j)))/std(x(:,j));
    end;
end