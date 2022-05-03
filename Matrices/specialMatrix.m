function [A] = specialMatrix(n,m)
% Homework 5 - Write a function that returns a n x m matrix with elements that hav the following values.
    %The value of each element in the first row is the number of the column
    %The value of each element in the first column in the number of the row
    %The rest of the elements each has a value equal to the sum of the
         %element above it and element to the left
    %The function must return a sensible error if the user does not input
         %exactly two arguments
    %The function should be well commented
%Created by: Hope Chiappini
%Created on: 1-26-2022
%Last edited on: 1-26-2022
%
% This function should return a matrix A as described in the problem statement
% Inputs n is the number of rows, and m the number of columns
% It is recomended to first create the matrxix A of the correct size, filling it with zeros to start with is not a bad choice

%Setting up error message for inputs
if nargin == 2
    disp('Loading Matrix...')
else
    disp('Error: there should be two inputs')
end
A = zeros(n,m)

q=0
for i=1:n
    A(i,1)=q+1
    q=q+1
end
q=0
for j=1:m
    A(1,j)=q+1
    q=q+1
end

for k=2:n
    for h=2:m
        A(k,h)= A(k-1,h) + A(k,h-1)
    end
end


end