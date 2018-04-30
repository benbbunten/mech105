function[t,y]=Heun(dydt,tspan,y0,h,es,maxit)
%This function will find the solution to the differential equation dy/dt
%using an iterative huens method. es and matit are optioanl and will be set
%to .001 and 50 if not entered. Huen method has a potential to be every
%off from the actual equation if h is too big. 
%
%Inputs 
%   dydt: the differnetial equation in question must be an anonymous
%       function of the form dydt=f(t,y).
%   tspan: bounds that are being evaluated writen as [lowerbound,
%       upperbound
%   y0: inital vaule of Y when t=0
%   h: step size should be fairly small around .1 is ideal 
%   es: esimate error stoping critria (optional, will be set to .001 if
%   left empty)
%   maxit: maximum iteration ( optional will be set to 50 if not
%   entered)
%
%Outputs
%   t: vaules of t 
%   y: vaules of y

%% Input checks 
    % check for correct input vaules and inputs standard vaules if they
    % arent entered 
if nargin<4
    error('more input varible necissary to run function, check syntax')
end
if nargin==4
    es=.001
    maxit=50
end
if nargin==5
    maxit=50
end
if nargin>6
    error('too many inputs check syntax')
end

%% The meat 
y(1)=y0 % initiats y vaule
t=tspan(1):h:tspan(2) % creates a t variable counting by h, if tspan and h 
% dont agree this will chop t off exculding the final vaule of tspan which will be accounted for later 
st=length(t)
ea=100
for i=1:st-1
    iter=0                          % predicts the next y vaule with eulers method 
    slopeest=dydt(t(i),y(i))
    y(i+1)=y(i)+(h*slopeest)
    while ea>es && iter<maxit
        yest=y(i+1)                 % corrects the predidictor vaule and then iterats until an acceptable vaule is reached 
        slope2=dydt(t(i+1),y(i+1))
        slopeb=(slopeest+slope2)/2
        y(i+1)=y(i)+(h*slopeb)
        ea=(y(i+1)-yest)/y(i+1)
        iter=iter+1
    end
end
%% correction for weird bounds  
% for cases where tspan and h do not agree this will calcuate the final
% vaule of t span with a new step size 
if tspan(2)~=t(st) 
    t(st+1)=tspan(2)
    slopeest=dydt(t(st),y(st))
    y(st+1)=y(st)+((tspan(2)-t(st))*slopeest)
      while ea>es && iter<maxit
        yest=y(st+1)
        slope2=dydt(tspan(2),y(st+1))
        slopeb=(slopeest+slope2)/2
        y(st+1)=y(st)+((tspan(2)-t(st))*slopeb)
        ea=(y(st+1)-yest)/y(st+1)
        iter=iter+1
      end
end
%% Plot
plot(t,y)   % plots the solution 
xlabel('t')
ylabel('y')

