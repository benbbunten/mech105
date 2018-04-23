function [A1]=invermatrix(A)
%this function will find the inverse of a matrix 
%Input
%A= a Matrix you want to find the inverse of
%Output 
%A1= the inverse of A


[L,U,P]=luFactor(A); %factors A into L,U and P 
[row,colm]=size(A); %finds size of matrix
for o=1:colm 
    i=zeros(row,1); % sets up an identity columb vector 
    i(o,1)=1;
    d=L\i    ; % evaulates and finds the inverse 
    A1(:,o)=U\d;
end
