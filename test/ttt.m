mucsubp1=ctrbon_2(PPsubp1,Xonlinesubp1,ctrblimitsubp1);
mucsubp1 = mucsubp1(1:11,1);
mucresult = mucsubp1';

%*******���ݱ�׼������***********
[n,m]=size(X0);
xmean=mean(X0);
xstd=std(X0);
X=standard(X0);
ymean=mean(Y0);
ystd=std(Y0);
Y=standard(Y0); 

%��ȡ����
Dist = [];
Distp1=[];
Distp3 = [];
Distsubp1=[];
Distsubp2=[];


a = mean(Xonlinep3)
b = mean(Scoreonlinep3')

xxxsubp1 = standard(A5(1:100,1:11));  
xxxsubp2 = standard(A1(1:100,16:26));
xxxp3 = standard(A1(1:100,31:35));

Xonlinesubp1 = [xsubp1' xxsubp1' xxxsubp1']';  
Xonlinesubp2 = [xsubp2' xxsubp2' xxxsubp2']'; 
Xonlinep3 = [xp3' xxp3' xxxp3']'; 

ttt = A5(1:100,31:35);
ttt2 = zscore(ttt);
te2 = mean(ttt2)
ttt(:,4) = ttt(:,4)*0.00000587;
xxp3 = zscore(ttt);
te = mean(xxp3)

%����÷�����
Scoreonlinesubp1 = Xonlinesubp1*PPsubp1;
Scoreonlinesubp2 = Xonlinesubp2*PPsubp2;

%��ȡ�ӹ���1,2�ĵ÷֣��ó�����1 �Ĺ�����Ϣ
Xonlinep1 = [Scoreonlinesubp1 Scoreonlinesubp2];

%������̼�ÿ�����ݵĵ÷�
Scoreonlinep1 = Xonlinep1*PPp1;
Scoreonlinep31 = xp3*PPp3;
Scoreonlinep32 = xxp3*PPp3 ;
diyige = mean(xp3)
dierge = mean(xxp3)
t1 = pdist2(Centerp3,xxp3);
t2 = pdist2(Centerp3,ttt2);
min(t1)
min(t2)
%��ȡ���̼��ĵ÷�����������ȫ���̵Ĺ��̱���
Xonline = [Scoreonlinep1  Scoreonlinep3];

%����ȫ���̵ĵ÷�
Scoreonline = Xonline * PP;

%���������ݼ����ľ���
Distsubp1 = pdist2(Centersubp1,Scoreonlinesubp1);
Distsubp2 = pdist2(Centersubp2,Scoreonlinesubp2);
Distp1 = pdist2(Centerp1,Scoreonlinep1);
Distp3 = pdist2(Centerp3,Scoreonlinep3);
Dist = pdist2(Center,Scoreonline);
