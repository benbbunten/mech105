function [root,fx,ea,iter]=falsePosition(func,xl,xu,es,maxiter)
%
% The function falsePosition will evaluate a function for it roots. The
% function will need an upper and lower limit to evaluate. The last two
% imputs are optional and will be give standerd vaules if not inputed.
% Synatax:
%   [root,fx,ea,iter]=falsePosition(func,xl,xu,es,maxiter)
% Inputs:
%  func: the function to be evlauated 
%  xl: the lower bracket o the function must be negative
%  xu: the upper bracket of the function must be positive
%  es: precent difence of new and previos estimate. THIS VAULE IS PERCENT NOT A DECIMAL. An optional estimate
%      and will be set to 0.01% if not eneted 
%  iter: Amount of interation before the program stops if it hasnt reached
%        es. also optional and will be set to 100 if not entered 
%Outputs 
%  root: the root vaule (ansewr to your function)
%  fx: the function evaluated at the esimated root 
%  ea: precent error comparing to previos estimate 
%  iter: amout of iteration before the root was determined. 

%checks for proper inputs and sets es and iter if not entered 
if nargin<3;
    error('more inputs necessary to evaluate, check syntax and try again')
elseif nargin==4;
    maxiter=100;
elseif nargin==3
    maxiter=100;
    es=.01
elseif nargin>5
    error ('too many inputs, check syntax and try again')
end
%check for positive and negative xl and xu
if func(xl).*func(xu)>0;
    error('no sign change in upper and lower bounds')
end

%sets variables for intial loop 
ea=1;
iter=0; % will count iterations
root=xl;
while ea>es && iter<maxiter
    iter=iter+1;   %counts interations
    prevroot=root; %saves previos root estimate for error calculations later
    root= xu-((func(xu)*(xl-xu))/(func(xl)-func(xu))); %calcluates new root
   % checks sign of root and replaces correct bound with new root
    if (func(root)*func(xu))>0; 
        xu=root;
    elseif (func(root)*func(xl))>0;
        xl=root;
    end
    %calculates estimate error
    ea=abs((root-prevroot)/root)*100;
end
fx=func(root); % finds vaules of function at root
fprintf('The function has an esimated root at the vaule %5.3f the precent error for this estimate is %5.3f it took %d iteration to arrive at this vaule The function evaluated at the root has a vaule of %5.3f ', root, ea, iter, fx)
