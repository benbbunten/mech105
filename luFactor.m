function [L,U,P]=luFactor(A)
% This function will factor a matrix A into L and U with pivoting stored in
% P. L and U can then be used to solve the set of linear equation for many
% differnt B vaules
%Inputs
% A= A square matrix of the coeffients of a set of lieanr equations
%Outputs
% L= A lower triangular matrix of the vaules used to emlinte vaules of A
%    that will end up give use U
% U= A upper triangular matrix composed of the A matix after Guass
%    elimination 
% P= A matix that records pivoting


[row,colb]=size(A);%set up a row and columb vaule 
if row~=colb %check matrix dimesions
    error('invalide matrix dimensions')
end
%set up blank matixs for L,U,andP
L=eye(row);
U=A;
P=eye(row);

for c=1:(colb-1);
   %pivot
   [vaule,pr]=max(abs(U(c:row,c)));%finds the absolute max and the row of said max
   pr=pr+(c-1); %changes pivot row into the actual row
   if pr~=1
           U([c,pr],:)= U([pr,c],:); %pivots U
           P([c,pr],:)=P([pr,c],:);  %pivots P
           L([c,pr],[1:(c-1)])=L([pr,c],[1:(c-1)]); %pivots L
   end
      %eliminate
      for r=(c+1):row;
          L(r,c)=(U(r,c)/U(c,c)); %stores the vaule of the number being used to divide 
          U(r,:)=U(r,:)-((U(r,c)/U(c,c))*U(c,:));  %elimitates 
      end
end
disp(L)
disp(U)
disp(P)



       
       
       
       
       
       