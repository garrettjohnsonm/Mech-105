function [L,U,P] = luFactor(A)
%luFactor is a function that has one input, A: a given square matrix, and 3
%outputs L, U, and P (all the same size matrix as A.  L is a lower triangle
%matrix with 1 across the diagonal and the factors of gauss elimination
%used to obtain matrix U below to diagonal. U is an upper triangle matrix obtained by
%using gauss elimination method on the matrix A.  P is the identity matrix
%rearranged whenever any row is pivoted.  luFactor's inputs and outputs
%should satisfy the equation: [P][A]=[L][U]

[row column]= size(A); %size of matrix
L=eye(row); %initially the lower triangle matrix starts as identity matrix the size of A
P=eye(row); %pivot matrix starts as identity matrix the size of A
U=A; %initially the upper triangle matrix starts as A

if row~=column %if rows do not equal columns error will be stated
    error('must be square matrix') 
end
if nargin<1 || nargin>1 %number of arguments must be equal to one square matrix
    error('you must input ONE square matrix, A')
end
for i=1:row
    largestnumb=max(abs(A(:,1)));  %finds the largest absolute value of the first column to pivot
    
    for j=i:row; %this for loop and if statement determines which row to pivot to the top to prepare the U matrix for gauss elimination
        if abs(U(j,i))==largestnumb %finds absolute max value of column 1
            newlargestnumb=j; %moves row to top
        end
    end
    U([i,newlargestnumb],:) = U([newlargestnumb,i],:);  %executes 1st step of gauss by pivoting the rows of original A to have largest number in first row
    L([i,newlargestnumb],1:i-1)= L([newlargestnumb,i],1:i-1); %pivots lower triangle matrix to keep up with the pivoting of U
    P([i,newlargestnumb],:)=P([newlargestnumb,i],:); %pivots the identity matrix to match the 
  for j=i+1:column
    L(j,i)=U(j,i)/U(i,i); %actual process of gauss elimination: determines what factor to multiply the top row by (these factors go into the L matrix)
    U(j,i:column) = U(j,i:column)-L(j,i)*U(i,i:column); %subtract top row from second row 
  end
end
%displays the outputs
disp('L is')
disp(L) 
disp('U is')
disp(U)
disp('P is')
disp(P)
end

