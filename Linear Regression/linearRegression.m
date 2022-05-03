function [fX, fY, slope, intercept, Rsquared] = linearRegression(x,y)
%Created By: Hope Chiappini
%linearRegression Computes the linear regression of a data set
%   Compute the linear regression based on inputs:
%     1. x: x-values for our data set
%     2. y: y-values for our data set
%
%   Outputs:
%     1. fX: x-values with outliers removed
%     2. fY: y-values with outliers removed
%     3. slope: slope from the linear regression y=mx+b
%     4. intercept: intercept from the linear regression y=mx+b
%     5. Rsquared: R^2, a.k.a. coefficient of determination

%Does x = y in length?
if length(x) ~= length(y)
    error ('length of x and y are the same')
end

%Given instrucions to sort
[sortedY, sortOrder] = sort(y);
sortedX = x(sortOrder);
%Solving for outliers
fX = sortedX;
fY = sortedY;
L = length(fY);
Q1I = floor((L+1)/4);
Q3I = floor(((3*L)+3)/4);
Q1 = fY(Q1I);
Q3 = fY(Q3I);
IQR = Q3-Q1;
OutlierRange = 1.5*IQR;
while (Q1 - OutlierRange) > fY(1)
    fY=fY(1,2:1:L);
    fX=fX(1,2:1:L);
    L = length(fY);
end
L = length(fY);
while fY(L) > (Q3 + OutlierRange)
    fY=fY(1,1:1:(L-1));
    fX=fX(1,1:1:(L-1));
    L=length(fY);
end
%Various values needed with sorted and filtered data points
Xav = mean(fX);
Yav = mean(fY);
n = length(fY);
SXY = 0;
SX = 0;
SY = 0;
SXX = 0;
Sr = 0;
St = 0;
%Solving for the sum of x times y
for i=1:length(fY)
SXY = SXY+(fX(i)*fY(i));
end
%Solving for the sum of x
for i=1:length(fY)
SX = SX+(fX(i));
end
%Solving for the sum of y
for i=1:length(fY)
SY = SY+(fY(i));
end
%Solving for the sum of x squared
for i=1:length(fY)
SXX = SXX+((fX(i))^2);
end
SX2 = (SX)^2;
%Solving for slope (a1)
slope = ((n*SXY)-(SX*SY))/((n*SXX)-(SX2));
%Solving for intercept (a2)
intercept = Yav-(slope*Xav);
%Rsquared value

%Finding the sum of squares of the residuals
for i=1:length(fY)
Sr = Sr+((fY(i)-intercept-(slope*fX(i)))^2);
end
%Finding the total sum of squares
for i=1:length(fY)
St = St+((fY(i)-Yav)^2);
end
Rsquared = (St-Sr)/St;
end