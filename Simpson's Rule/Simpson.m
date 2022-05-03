%% Simpson's 1/3 Rule
%Created by: Hope Chiappini
%Created on: 4-10-2022
%Last edited on: 4-10-2022
%Write a general MATLAB function for integrating experimental data using
%Simpson's 1/3 rule. Your function should check if there are an odd number
%of intervals, it there are, the trapezoidal rule should be used for the
%last intervale. The first line of your MATLAB function should look like:
     %function I = Simpson(x,y)
%Where the function numerically evaluates the integral of the vector of
%function values y with respect to x.
%Your matlab function should also include the following:
     %Error check that the inputs are the same length.
     %Error check that the x input is equally spaced.
     %Warn the user (not an error, just a warning) if the trapezoidal rule
     %has to be used on the last interval.
     
     
function [I] = Simpson(x, y)
% Numerical evaluation of integral by Simpson's 1/3 Rule
% Inputs
%   x = the vector of equally spaced independent variable
%   y = the vector of function values with respect to x
% Outputs:
%   I = the numerical integral calculated

L = length(x);
%checking number of inputs
if nargin ~= 2
    error('check your number of inputs')
end
%checking length of both vectors match up
if length(x) ~= length(y)
    error('inputs are not the same length')
end
%checking to make sure that the x intervals are the same
r = range(x(2:L)-x(1:(L-1)));
if sum(r) ~= 0
    error('x input is not equally spaced')
end
%for three points only
if L==3
    I=((x(3)-x(1))/6)*((y(1))+(4*(y(2)))+(y(3)));
    %check for / application of trapezoidal rule if false, and just simpson's
    %if true
    elseif mod(L-1,2) ~= 0
        warning('trapezodial rule was used on the last interval')
        odd = [3:2:L-1];
        even = [2:2:L-2];
        Io = (x(L)-x(L-1))*((y(L)+y(L-1))/2);
        I = Io+(((x(L-1)-x(1))*(y(1)+(4*sum(y(odd)))+(2*sum(y(even)))+y(L-1)))/(3*(L-1)));
    else
        odd = [3:2:L];
        even = [2:2:L-1];
        I = ((x(L)-x(1))*(y(1)+(2*sum(y(odd)))+(4*sum(y(even)))+y(L))/(3*(L-1)));
end
end