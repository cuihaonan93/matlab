
%%%%%%%%%%%%%离线建模程序--与“现场程序”的离线建模程序稍有不同，输出量多了A，T2,SPE，主要是为了离线画图和在线测试时用的%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%输入参数： 共3个
%          X1建模数据（矩阵 m*n维，m为样本个数，n为变量个数）
%          percent主元提取时累计贡献率的限值（一个百分数）
%输出参数： 共9个
%          P负载矩阵（矩阵 n*A维，n为变量个数，A为主元个数）
%          S与得分向量对应的特征值矩阵 （矩阵 A*A维，A为主元个数）
%          Xmean建模数据的均值
%          Xstd建模数据的方差
%          tmean得分矩阵的均值（行向量1*A维，A为主元个数）
%          L 存放T2和SPE控制限上限的一个行向量
%          SPEctrblimit各变量对SPE贡献的控制限上限（行向量1*n维，n为变量个数）
%          T2ctrblimit各变量对T2贡献的控制限上限（行向量1*n维，n为变量个数）
function [T,P]=PCAOffmodel(X0,A)
% 数据标准化
[X,~,~]=Stdz(X0);	
%******PCA******
[T,P,~,~]=PCA(X,A);
        	




