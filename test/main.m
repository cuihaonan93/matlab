clc;
load test.mat;       %��������

%�����̷ֿ����ݣ��ӹ��̣����������̣�����
[Xsubp1,xsubp1mean,xsubp1std] = zscore(A1(1:200,1:11));
[Xsubp2,xsubp2mean,xsubp2std] = zscore(A1(1:200,16:26));
[Xp3,xp3mean,xp3std] = zscore(A1(1:200,31:35));
Y = zscore(A1(1:200,36:end));

%�ӹ��̵�TPLS��ģ
[Tysubp1,Qysubp1,Pysubp1,Posubp1,Prsubp1,PPsubp1,ctrblimitsubp1]=TPLS(Xsubp1,Y,0.01,0.05);
[Tysubp2,Qysubp2,Pysubp2,Posubp2,Prsubp2,PPsubp2,ctrblimitsubp2]=TPLS(Xsubp2,Y,0.01,0.05);

%��ȡ�ӹ���1,2�÷��������������1�Ĺ��̱���
Xp1 = [Tysubp1 Tysubp2];

%���̼���TPLS��ģ(1,3)
[Typ1,Qyp1,Pyp1,Pop1,Prp1,PPp1,ctrblimitp1]=TPLS(Xp1,Y,0.01,0.05);
[Typ3,Qyp3,Pyp3,Pop3,Prp3,PPp3,ctrblimitp3]=TPLS(Xp3,Y,0.01,0.05);

%��ȡ���̼��ĵ÷�����������ȫ���̵Ĺ��̱���
X = [Typ1,Typ3];

%ȫ���̵�TPLS��ģ
[Ty,Qy,Py,Po,Pr,PP] = TPLS(X,Y,0.01,0.05);

%����ÿ��ģ������
Centersubp1 = mean(Tysubp1);
Centersubp2 = mean(Tysubp2);
Centerp1 = mean(Typ1);
Centerp3 = mean(Typ3);
Center = mean(Ty);


%��������--��ȡ��������
xsubp1 = stdon(A1(1:100,1:11),xsubp1mean,xsubp1std);  
xsubp2 = stdon(A1(1:100,16:26),xsubp2mean,xsubp2std);
xp3 = stdon(A1(1:100,31:35),xp3mean,xp3std);

tt = A1(1:100,16:26);
tt(:,2) = 10*tt(:,2);
tt(:,3) = 0.1*tt(:,3);
xxsubp1 = stdon(A1(1:100,1:11),xsubp1mean,xsubp1std);  
xxsubp2 = stdon(tt,xsubp2mean,xsubp2std);
xxp3 = stdon(A1(1:100,31:35),xp3mean,xp3std);

%�ӹ��̲�÷�����
sonlinesubp1 = xsubp1 * PPsubp1;
sonlinesubp2 = xsubp2 * PPsubp2;
ssonlinesubp1 = xxsubp1 * PPsubp1;
ssonlinesubp2 = xxsubp2 * PPsubp2;

distsubp1 = pdist2(Centersubp1,sonlinesubp1);
distsubp2 = pdist2(Centersubp2,sonlinesubp2);
ddistsubp1 = pdist2(Centersubp1,ssonlinesubp1);
ddistsubp2 = pdist2(Centersubp2,ssonlinesubp2);

xp1 = [sonlinesubp1 sonlinesubp2];
xxp1 = [ssonlinesubp1 ssonlinesubp2];
%���̲�÷�����
sonlinep1 = xp1 * PPp1;
sonlinep3 = xp3 * PPp3;
ssonlinep1 = xxp1 * PPp1;
ssonlinep3 = xxp3 * PPp3;

distp1 = pdist2(Centerp1,sonlinep1);
distp3 = pdist2(Centerp3,sonlinep3);
ddistp1 = pdist2(Centerp1,ssonlinep1);
ddistp3 = pdist2(Centerp3,ssonlinep3);

x = [sonlinep1 sonlinep3];
xx = [ssonlinep1 ssonlinep3];
%ȫ���̵÷�����
sonline = x * PP;
ssonline = xx * PP;
dist = pdist2(Center,sonline);
ddist = pdist2(Center,ssonline);

%��ȫ���̵�ͼ
Dist = [dist ddist];
Distp1 = [distp1 ddistp1];
Distp3 = [distp3 ddistp3];
Distsubp1 = [distsubp1 ddistsubp1];
Distsubp2 = [distsubp2 ddistsubp2];
figure;
xlim([0,202]);ylim([0,1.1]);
hold on;
uX=1:200;
uY=exp(-0.000005*Dist(uX));
plot(uX,uY);
h1 = refline(0,0.95);
set(h1,'color','r')
set(h1,'line','--')
xlabel('����');
ylabel('ָ��');
title('ȫ��������')
legend('ָ��','��ֵ');
grid on;
box on;
hold off;

%�����̲��ͼ
figure;
hold on;
uX=1:200;
uY=exp(-0.000005*Distp1(uX));
subplot(2,1,1):plot(uX,uY);
xlim([0,202]);ylim([0,1.1]);
h1 = refline(0,0.95);
set(h1,'color','r')
set(h1,'line','--')
xlabel('����');
ylabel('ָ��');
title('���̲�-����')
grid on;
legend('ָ��','��ֵ');
uP = exp(-0.000005*Distp3(uX));
subplot(2,1,2):plot(uX,uP);
xlim([0,202]);ylim([0,1.1]);
h1 = refline(0,0.95);
set(h1,'color','r')
set(h1,'line','--')
xlabel('����');
ylabel('ָ��');
title('���̲�-�û�')
legend('ָ��','��ֵ');
grid on;
box on;
hold off;

%���ӹ��̲��ͼ
figure;
hold on;
uX=1:200;
uQ=exp(-0.000005*Distsubp1(uX));
subplot(2,1,1):plot(uX,uQ);
xlim([0,202]);ylim([0,1.1]);
h1 = refline(0,0.95);
set(h1,'color','r')
set(h1,'line','--')
xlabel('����');
ylabel('ָ��');
title('�ӹ��̲�-һ��')
grid on;
legend('ָ��','��ֵ');
uW = exp(-0.000005*Distsubp2(uX));
subplot(2,1,2):plot(uX,uW);
xlim([0,202]);ylim([0,1.1]);
h1 = refline(0,0.95);
set(h1,'color','r')
set(h1,'line','--')
xlabel('����');
ylabel('ָ��');
title('�ӹ��̲�-����')
legend('ָ��','��ֵ');
grid on;
box on;
hold off;

%������ͼ
figure;
ctrbsubp1 = ctrbon(PPsubp1,xxsubp1,ctrblimitsubp1);
ctrbsubp2 = ctrbon(PPsubp2,xxsubp2,ctrblimitsubp2)
ctrbp3 = ctrbon(PPp3,xxp3,ctrblimitp3);
num = size(ctrbsubp2,2);
a = 1:1:num;
column = [];
for i=1:num
    if ctrbsubp2(i) > 0.03;
        column = [column i]
    end
end
showctrb = bar(a,ctrbsubp2);
xlabel('����'),ylabel('������');
text(column(1),ctrbsubp2(1),'��һ�������軯������ƫ�󣬼����Լ�ҩ������')
text(column(2),ctrbsubp2(2),'�ڶ��������軯������ƫС�������Լ�ҩ������')
%set(gca,'xticklabel',{'��Ũ��','��һ�������軯������','�ڶ��������軯������','���Ľ������軯������','��һ�����ۿ�������','�ڶ������ۿ�������','���������ۿ�������','���Ľ����ۿ�������','��һ�������ܽ���Ũ��','��һ�������������Ũ��','���Ľ������������Ũ��'},'FontSize',12)
grid on;