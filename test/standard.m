function sx=standard(x)             
%��X���н��б�׼��
[n,m]=size(x);
sx=zeros(n,m);
for j=1:m;
    if std(x(:,j))==0;
        sx(:,j)=0;
    else
       sx(:,j)=(x(:,j)-mean(x(:,j)))/std(x(:,j));
    end;
end