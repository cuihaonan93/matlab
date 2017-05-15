function [ Dis,Dissubp1,Dissubp2,Disp1,Disp3] = Score( Xonlinesubp1,Xonlinesubp2,Xonlinep3,PPsubp1,PPsubp2,PPp1,PPp3,PP,Centersubp1,Centersubp2,Centerp1,Centerp3,Center )
%逐条进行TPLS方法，即重复上述过程
%计算子过程级每条数据的得分
index = size(Xonlinesubp1,1);
Scoreonlinesubp1 = [];
Scoreonlinesubp2 = [];
for i = 1:index,
    subp1 = Xonlinesubp1(i,:)*PPsubp1;
    Scoreonlinesubp1 = [Scoreonlinesubp1 subp1'];
    subp2 = Xonlinesubp2(i,:)*PPsubp2;
    Scoreonlinesubp2 = [Scoreonlinesubp2 subp2'];
end

%提取子过程1,2的得分，得出过程1 的过程信息
Scoreonlinesubp1 = Scoreonlinesubp1';
Scoreonlinesubp2 = Scoreonlinesubp2';
Xonlinep1 = [Scoreonlinesubp1 Scoreonlinesubp2];

%计算过程级每条数据的得分
index = size(Xonlinep1,1);
Scoreonlinep1 = [];
Scoreonlinep3 = [];
for i = 1:index,
    p1 = Xonlinep1(i,:)*PPp1;
    Scoreonlinep1 = [Scoreonlinep1 p1'];
end
for i= 1:100,
    p3 = Xonlinep3(i,:)*PPp3;
    Scoreonlinep3 = [Scoreonlinep3 p3'];
end

%提取过程级的得分向量，构造全流程的过程变量
Scoreonlinep1 = Scoreonlinep1';
Scoreonlinep3 = Scoreonlinep3';
Xonline = [Scoreonlinep1  Scoreonlinep3];

%计算全流程的得分
Scoreonline = Xonline * PP;

%计算与数据集中心距离
a = size(Center)
b = size(Scoreonline)
Dis = pdist2(Center,Scoreonline);

%计算与过程层距离
Disp1 = [];
for i =1:size(Scoreonlinep1,1),
    disp1 = pdist2(Centerp1,Scoreonlinep1(i,:),'seuclidean');
    Disp1 = [Disp1 disp1];
end
Disp1;

Disp3 = [];
for i =1:size(Scoreonlinep3,1),
    disp3 = pdist2(Centerp3,Scoreonlinep3(i,:),'seuclidean');
    Disp3 = [Disp3 disp3];
end
Disp3;

%计算子过程层各块的距离
Dissubp1 = [];
for i =1:size(Scoreonlinesubp1,1),
    dissubp1 = pdist2(Centersubp1,Scoreonlinesubp1(i,:),'seuclidean');
    Dissubp1 = [Dissubp1 dissubp1];
end
Dissubp1;

Dissubp2 = [];
for i =1:size(Scoreonlinesubp2,1),
    dissubp2 = pdist2(Centersubp2,Scoreonlinesubp2(i,:),'seuclidean');
    Dissubp2 = [Dissubp2 dissubp2];
end
Dissubp2;


end

