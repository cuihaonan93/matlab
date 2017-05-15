function [B,W,P,Q,R,T]=neupls(X,Y,A)
n=nargin;                           % 函数输 参数的个数(shuruba?)
[~, J]=size(X);                       % distinguish the number of rows and columns of X
[~, M]=size(Y);                       % distinguish the number of rows and columns of Y
if n<3,                              % if we do not input A,A=J,(all)
    A=J;
end
XY=X'*Y;                             % compute X'*Y
W=[];                                % initialize W1,P1,Q1,R1,T1
P=[];
Q=[];
R=[];
T=[];

for i=1:A,                           % J=number of PLS components to be computed
    if M==1,                             % if there is a single response variable, compute the
      w=XY;                                % X-weights as shown here
    else                                 % else
    [C,D]=eig(XY'*XY);                   % first compute the eigenvectors of Y'XX'Y
      q=C(:,find(diag(D)==max(diag(D))));  % find the eigenvector corresponding to the largest
                                           % eigenvalue
      w=(XY*q);                            % compute X-weights
    end
     w=w/sqrt(w'*w);                      % normalize w to unity
     r=w;                                 % loop to compute ri
   for j=1:i-1,
      r=r-(P(:,j)'*w)*R(:,j);
   end
t=X*r;                               % compute score vector
tt=(t'*t);                           % compute t't
p=(X'*t)/tt;                         % X-loadings
q=(r'*XY)'/tt;                       % Y-loadings
XY=XY-(p*q')*tt;                     % X'Y deflation
W=[W w];                             % store loadings and weights
P=[P p];
Q=[Q q];
R=[R r];
T=[T t];
end
B=R*Q'; % compute the regression coeffcients