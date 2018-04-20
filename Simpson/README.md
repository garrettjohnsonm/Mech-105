## Simpsons function

  This function takes two inputs from the user, x and y, and applies theSimpson's 1/3 rule to this data.  Simpson's 1/3 rule is simply a method of integrating a function. 

  If there are an odd number of intervals, (which means an even number of points was entered) trapezoidal rule will be used to integrate the final interval. 
  
## Inputs:
x= an array (one row vector) of data points to be plotted on the
x axis THESE NUMBERS BE EQUALLY SPACED

y= an array of data that is to be plotted on the y axis

**The inputed arrays must have the same length or else the function will not
work
The array are 'lined up' and plotted as points as a function, Simpsons 1/3
is then applied to this function.
 
 ## Process
 On each interval, the y values of the end points and the mid point are weighted and taken the average of to find the integral.
 if there is an extra interval the trapazoid rule is used. The trapezoid rule takes the y values of the two end points of the last interval and takes the average of them to find the integral.  These integral values are added to find the estimate of the function.
