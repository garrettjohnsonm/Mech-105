function [root,fx,ea,iter]= falsePosition(func,xl,xu,es,maxiter)
%The purpose of this false position algorithm is to determine the root of a given function
%The user must input the function (func), by creating a func using @x, they want to evaluate along with their
%estimates of an upper(xu) and lower(xl) bounds where the function crosses the x
%axis. This algorithm will calculate the approximate root between those
%points with a certain error and amount of iterations
%Check all different combinations of input
if nargin<3 || nargin>5 % if the number of inputs is under 3 or over 5 then an error will display
    error('Check input values')
elseif nargin==3  %if minimum inputs- set es and iter to default quantities
    es=0.0001;
    maxiter=200 ;
else nargin==4 %if only 4 arguments set iterations to default
    maxiter=200;
end
% Checking bounds process
fxl= feval(func,xl); %f(x) evaluated at lower bound
fxu= feval(func,xu); %f(x) evaluated at upper bound
if fxl*fxu<0 %check for sign change
    disp('Bounds contain root')
else 
    error('Choose new bounds') %root is not contained in bounds
end
%Checking iterations process
iter = 0; %start iterations at 0
ea=100; %approx error starts at 100 percent
root=xl;
while ea>=es && iter<maxiter %loop will stop when error is less than desired error or when number of iterations exceeds default(200) or iter inputed 
    oldroot=root; %root is made into new variable to continue loop
    fxl= feval(func,xl); %f(x) evaluated at lower bound
    fxu= feval(func,xu); %f(x) evaluated at upper bound

    root=xu-(fxu*(xl-xu))/(fxl-fxu); %false position formula
    iter=iter+1; %iterations increase each loop
    
    ea = abs((root-oldroot)/root)*100;  % approx relative error formula
    froot=feval(func,root);  % root evaluated in function
    if (froot * fxl) < 0 %determine newly estimated root by testing where sign changes 
        xu = root;
    elseif (froot * fxl) > 0
        xl = root;
    end
end
fx = feval(func,root);  %display all output variables
   fprintf('root is equal to %d \n',root)
   fprintf('function evaluated at root is equal to %d \n',fx)
   fprintf('approximate relative error is equal to %d \n',ea)
   fprintf('the number of iterations is %d \n',iter)
end

