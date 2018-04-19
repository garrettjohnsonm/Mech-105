function I = Simpson(x,y)
%This function takes two inputs from the user, x and y, and apply the
%Simpson's 1/3 rule to this data.  Simpson's 1/3 rule is simply a method of
%integrating a function. If there are an odd number of intervals,
%trapezoidal rule will be used to integrate the final interval. 
%Inputs: x= an array (one row vector) of data points to be plotted on the x
%x axis THESE NUMBERS BE EQUALLY SPACED
%y= an array of data that is to be plotted on the y axis
%The inputed arrays must have the same length or else the function will not
%work
%The array are 'lined up' and plotted as points as a function, Simpsons 1/3
%is then applied to this function.
if nargin< 2 %checking if there are right amount of inputs 
    error('must input two arrays, x and y, (x being an equally spaced array)')
end
if nargin>2
    error('too many inputs, must input two arrays, x and y, (x being an equally spaced array)')
end
%set lengths of arrays
i=length(x);
j=length(y);
b=x(1,i); %last element of x
a=x(1); %first element of x
fx1=0; %element1 of simpsons formula
fx2=0;%element2 of simpsons formula
% input equal length check
if i~=j
    error('x and y must have equal amount of numbers in their arrays')
end
%interval check
if mod(i,2)== 1 %mod checks the remainder of i/2, if remainder is 1, that means there is an odd amount of intervals  
    trapezoidal=1;
    warning('trapezoidal rule is being used for last interval')
end
%equally spacing check
maxspace=max(diff(x));  %find largest interval between points
minspace=min(diff(x));  %find smallest interval between points
if maxspace-minspace>1.0e-7  %if the difference between those is greater than very small number than they are not evenly spaced
    error('the x array is not evenly spaced')
end
for xvals=2:2:i  %setting intervals using even x values
    fx1= fx1+4*.y(xvals); %first part of simpsons 1/3 formula, uses y values that correlate to the xvals to integrate
end
for xvals=1:2:(n-1) %setting intervals using odd x values
    if x(xvals)== x(1) %if equal to first element of x
        fx2=fx2+y(xvals); %second part of simpsons 1/3 formula, uses y vals of odd xvals to integrate
    else x(xvals)~=x(1) %if not equal to first element of x then...
        fx2=fx2+2*.y(xvals); % this is second part of simpsons 1/3 formula
    end
   if x(xvals)==x(n-1) && trapezoidal==1 %engages trapezoidal rule for last interval (if there are an odd number of intervals)
       fx2=fx2+((y(n-1)+y(n))/2); %trap formula
   end
end
        
I=(b-a)*((fx1+fx2)/6); %piece together simpsons 1/3 formula
end

