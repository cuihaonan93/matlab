%��������� X��ģ���ݣ����� m*nά��mΪ����������nΪ����������
%          percent�ۼƹ����ʵ����ޣ�һ���ٷ�����
%��������� T�÷־��󣨾��� m*Aά��mΪ����������AΪ��Ԫ������
%          P���ؾ��󣨾��� n*Aά��nΪ����������AΪ��Ԫ������
%          A��Ԫ����
%          S��÷�������Ӧ������ֵ���󣨾��� A*Aά��AΪ��Ԫ������
%          Xstar��X�Ĺ���ֵ������ m*nά��mΪ����������nΪ����������
function [T,P,S,Xstar]=PCA(X0,A)
[X,~,~] = Stdz(X0);
[~,n]=size(X);
P=[];%T=[];
V=cov(X);                    % ����x��Э�������
[vec0,val0]=eig(V);          %������ֵ����������
val=fliplr(diag(val0)');     %������ֵ���մӴ�С��˳������
vec=fliplr(vec0);            %��������������˳��ʹ֮������ֵ���Ӧ

% p=sum(val);                 % �����ۼƹ����ʼ��㱣����Ԫ����A
% for i=1:n
%     q=sum(val(1,1:i));
%     if (q/p>=percent)
%         A=i;
%         break
%     end
% end
S=diag(val(1,1:A));
P=[P vec(:,1:A)];
T=X*P;
Xstar=T*P';
return;