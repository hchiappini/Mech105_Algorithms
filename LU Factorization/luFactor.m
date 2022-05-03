%% LU Factorization with Partial pivoting
% A mech 105 algorithm 
%Created by: Hope Chiappini
%Created on: 3-31-2022
%Last Edited on: 3-31-2022

%Develop a MATLAB function that determines the LU Factorization of a square
%matrix. Your algorithm must use partial pivoting.
%For full credit, you must include appropriate error checking. If you are
%confused about what would be appropriate or have questions, feel free to
%come to office hours!
     %Inputs-
          %A-coefficient matrix
     %Outputs-
          %L-lower triangular matrix, with 1's along the diagonals
          %U-upper triangular matrix
          %P-the pivot matrix
%Remember, a correctly solved LU factorization solves for the problem 
%P*A = L*U, which is a good check to make sure your solution is correct.

function [L, U, P] = luFactor(A)
% luFactor(A)
%	LU decomposition with pivotiing
% inputs:
%	A = coefficient matrix
% outputs:
%	L = lower triangular matrix
%	U = upper triangular matrix
%       P = the permutation matrix
[Arow,Acol]=size(A);
if Arow~=Acol
    error('Matrix needs to be square')
end
Acoll=Acol+1;
P=eye(Arow); %setting up initial pivoting matrix
L=zeros(Arow,Acol);
U=A;
for j=1:Acol-1
    [MAX,pos]=max(abs(A(j:Acol,j))); %finding position of max value
    piv=pos + j -1; %determining pivot criteria
    if MAX > A(j,j) %check for need of pivot
        A([j,piv],:)=A([piv,j],:); %pivoting if needed
        L([j,piv],:)=L([piv,j],:);
        P([j,piv],:)=P([piv,j],:);
    end
    for w = j+1:Acol
        change=A(w,j)/A(j,j);
        A(w,j:Acol)=A(w,j:Acol)-change.*A(j,j:Acol);
        L(w,j)=change;
        U=A;
    end
end
for J=1:Acol
    L(J,J)=1;
end
end