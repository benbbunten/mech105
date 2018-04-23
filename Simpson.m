function [I]=Simpson(x,y)
%this function will evaulate a data set for its integral of y with respects
%to x. This function uses the simpsons composite 1/3 rule with a trapoziod
%rule for one interval if there is an odd number of intervals. 
%Inputs
%   x= The indepented varible, a row vector, must have equal spacing
%   y= the depentent varible, a row vector, must have same number of vaules
%   as x
%Outputs
%   I= the vaule of the intehral of y with respects to x. 

%creates variable for the sixe of y and c 
sx=length(x)
sy=length(y)
if sy~=sx % makes sure dimesions match 
    error('vector dimesions are not the same')
end
d=diff(x)
for c=2:(sx-1) %checks x for equal spacing 
    if d(c-1)~=d(c)
        error('x matrix must have equal spacing')
    end
end

if mod(sy,2)==0 %checks if y has odd of even number of intervals 
    %calculates I if ther is an odd number of intervals 
    warning('the vector has an odd number of inervals and a trapoziod rule must be used for the last interval') 
    I=(x(sx-1)-x(1))*(y(1)+4*sum(y(2:2:(sy-2)))+2*sum(y(3:2:(sy-3)))+y(sy-1))/(3*(sy-1))+((x(sy)-x(sy-1))*(y(sy)+y(sy-1))/2)
else
    %calculates I if there is an even number of intervals
    I=(x(sx)-x(1))*(y(1)+4*sum(y(2:2:(sy-1)))+2*sum(y(3:2:(sy-2)))+y(sy))/(3*sy)
end









    
    
    
    