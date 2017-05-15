mucsubp1=ctrbon_2(PPsubp1,Xonlinesubp1,ctrblimitsubp1);
mucsubp1 = mucsubp1(1:11,1);
mucresult = mucsubp1';

%*******数据标准化处理***********
[n,m]=size(X0);
xmean=mean(X0);
xstd=std(X0);
X=standard(X0);
ymean=mean(Y0);
ystd=std(Y0);
Y=standard(Y0); 

%获取距离
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

%计算得分向量
Scoreonlinesubp1 = Xonlinesubp1*PPsubp1;
Scoreonlinesubp2 = Xonlinesubp2*PPsubp2;

%提取子过程1,2的得分，得出过程1 的过程信息
Xonlinep1 = [Scoreonlinesubp1 Scoreonlinesubp2];

%计算过程级每条数据的得分
Scoreonlinep1 = Xonlinep1*PPp1;
Scoreonlinep31 = xp3*PPp3;
Scoreonlinep32 = xxp3*PPp3 ;
diyige = mean(xp3)
dierge = mean(xxp3)
t1 = pdist2(Centerp3,xxp3);
t2 = pdist2(Centerp3,ttt2);
min(t1)
min(t2)
%提取过程级的得分向量，构造全流程的过程变量
Xonline = [Scoreonlinep1  Scoreonlinep3];

%计算全流程的得分
Scoreonline = Xonline * PP;

%计算与数据集中心距离
Distsubp1 = pdist2(Centersubp1,Scoreonlinesubp1);
Distsubp2 = pdist2(Centersubp2,Scoreonlinesubp2);
Distp1 = pdist2(Centerp1,Scoreonlinep1);
Distp3 = pdist2(Centerp3,Scoreonlinep3);
Dist = pdist2(Center,Scoreonline);
