function [ Dis,Dissubp1,Dissubp2,Disp1,Disp3] = Score( Xonlinesubp1,Xonlinesubp2,Xonlinep3,PPsubp1,PPsubp2,PPp1,PPp3,PP,Centersubp1,Centersubp2,Centerp1,Centerp3,Center )
%��������TPLS���������ظ���������
%�����ӹ��̼�ÿ�����ݵĵ÷�
index = size(Xonlinesubp1,1);
Scoreonlinesubp1 = [];
Scoreonlinesubp2 = [];
for i = 1:index,
    subp1 = Xonlinesubp1(i,:)*PPsubp1;
    Scoreonlinesubp1 = [Scoreonlinesubp1 subp1'];
    subp2 = Xonlinesubp2(i,:)*PPsubp2;
    Scoreonlinesubp2 = [Scoreonlinesubp2 subp2'];
end

%��ȡ�ӹ���1,2�ĵ÷֣��ó�����1 �Ĺ�����Ϣ
Scoreonlinesubp1 = Scoreonlinesubp1';
Scoreonlinesubp2 = Scoreonlinesubp2';
Xonlinep1 = [Scoreonlinesubp1 Scoreonlinesubp2];

%������̼�ÿ�����ݵĵ÷�
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

%��ȡ���̼��ĵ÷�����������ȫ���̵Ĺ��̱���
Scoreonlinep1 = Scoreonlinep1';
Scoreonlinep3 = Scoreonlinep3';
Xonline = [Scoreonlinep1  Scoreonlinep3];

%����ȫ���̵ĵ÷�
Scoreonline = Xonline * PP;

%���������ݼ����ľ���
a = size(Center)
b = size(Scoreonline)
Dis = pdist2(Center,Scoreonline);

%��������̲����
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

%�����ӹ��̲����ľ���
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

