pz=xlsread('F:\���޺��TPLS����\pls\[muchong.com]b.xls');
mu=mean(pz);sig=std(pz); %���ֵ�ͱ�׼��
rr=corrcoef(pz); %�����ϵ������
data=zscore(pz); %���ݱ�׼��,�������� X*�� Y*
n=4;m=3; %n ���Ա����ĸ���,m ��������ĸ���
x0=pz(:,2:n);y0=pz(:,n+1:end); %ԭʼ���Ա��������������
e0=data(:,1:n);f0=data(:,n+1:end); %��׼������Ա��������������
num=size(e0,1);%��������ĸ���
chg=eye(n); %w �� w*�任����ĳ�ʼ��
for i=1:n
%���¼��� w�� w*�� t �ĵ÷�������
matrix=e0'*f0*f0'*e0;
[vec,val]=eig(matrix); %������ֵ����������
val=diag(val); %����Խ���Ԫ�أ����������ֵ
[val,ind]=sort(val,'descend');
w(:,i)=vec(:,ind(1)); %����������ֵ��Ӧ����������
w_star(:,i)=chg*w(:,i); %���� w*��ȡֵ
t(:,i)=e0*w(:,i); %����ɷ� ti �ĵ÷�
t
alpha=e0'*t(:,i)/(t(:,i)'*t(:,i)); %���� alpha_i
chg=chg*(eye(n)-w(:,i)*alpha'); %���� w �� w*�ı任����
e=e0-t(:,i)*alpha'; %����в����
e0=e;
%���¼��� ss(i)��ֵ
beta=t\f0; %��ع鷽�̵�ϵ�������ݱ�׼����û�г�����
cancha=f0-t*beta; %��в����
ss(i)=sum(sum(cancha.^2)); %�����ƽ����
%���¼��� press(i)
for j=1:num
t1=t(:,1:i);f1=f0;
she_t=t1(j,:);she_f=f1(j,:); %����ȥ�ĵ� j �������㱣������
t1(j,:)=[];f1(j,:)=[]; %ɾ���� j ���۲�ֵ
beta1=[t1,ones(num-1,1)]\f1; %��ع������ϵ��,������г�����
cancha=she_f-she_t*beta1(1:end-1,:)-beta1(end,:); %��в�����
press_i(j)=sum(cancha.^2); %�����ƽ����
end
press(i)=sum(press_i);
Q_h2(1)=1;
if i>1, Q_h2(i)=1-press(i)/ss(i-1); end
if Q_h2(i)<0.0975
fprintf('����ĳɷָ��� r=%d',i); break
end
end


