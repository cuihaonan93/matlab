clc;
load 重要数据20130730.mat;       %载入数据

%按过程分开数据，子过程１，２，过程２，３
Xsubp1 = [A1(1:100,1:10)];      
Y = [A1(1:100,36:end)];
Xsubp2 = [A1(1:100,11:20)];
%Ysubp2 = [A1(100:200,36:end)];
Xp2 = [A1(1:100,21:30)];
Xp3 = [A1(1:100,31:35)];

%子过程的TPLS建模
[Tysubp1,Qysubp1,Pysubp1,Posubp1,Prsubp1]=TPLS(Xsubp1,Y,0.01);
[Tysubp2,Qysubp2,Pysubp2,Posubp2,Prsubp2]=TPLS(Xsubp2,Y,0.01);

%提取子过程得分向量，构造过程的过程变量
Xp1 = [Tysubp1 Tysubp2];

%过程级的TPLS建模
[Typ1,Qyp1,Pyp1,Pop1,Prp1]=TPLS(Xp1,Y,0.01);
[Typ2,Qyp2,Pyp2,Pop2,Prp2]=TPLS(Xp2,Y,0.01);
[Typ3,Qyp3,Pyp3,Pop3,Prp3]=TPLS(Xp3,Y,0.01);

%提取过程级的得分向量，构造全流程的过程变量
X = [Typ1,Typ2,Typ3];

%全流程的TPLS建模
[Ty,Qy,Py,Po,Pr] = TPLS(X,Y,0.01);

%在线评价--获取在线数据
Xonlinesubp1 = [A1(101:200,1:10)];  
Xonlinesubp2 = [A1(101:200,11:20)];
Xonlinep2 = [A1(101:200,21:30)];
Xonlinep3 = [A1(101:200,31:35)];

%逐条进行TPLS方法，即重复上述过程
index = size(Xonlinesubp1,1)
for i = 1:10,
    size(Xonlinesubp1(i,:))
    [Tyonlinesubp1,Qonlinesubp1,Pyonlinesubp1,Poonlinesubp1,Pronlinesubp1]=TPLS(Xonlinesubp1(i,:),Y,0.01);
    Tyonlinesubp1
end

size(Ty);
mean(Ty);


