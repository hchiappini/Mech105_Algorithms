function [root, fx, ea, iter] = falsePosition(func, xl, xu, es, maxit, varargin)
%falsePosition finds the root of a function using false position method
    %Inputs:
        %func - the functions being evaluated
        %xl - the lower guess
        %xu - the upper guess
        %es - the desired relative error (defaults to 0.0001%)
        %maxit - the maximum number of iteration to use (defaults to 200)
    %Outputs:
        %root - the estimated root location
        %fx - the function evaluated at the root location
        %ea - the approximate relative error (%)
        %iter - how many iterations were performed
        iter = 0;
        ea = 10;
        xr = xl;
        if func(xl)*func(xu)== 0
            if func(xl) == 0
                root = xl
            else
                root = xu
            end
        end
        if func(xl)*func(xu) > 0
            error('Root not bracketed')
        end
        if nargin < 5
            maxit = 200;
        end
        if nargin < 4
            es = .000001;
        end
        if func(xl)*func(xu) < 0
            while ea > es
                xz = xr;
                xr = xu-((func(xu)*(xl-xu))/(func(xl)-func(xu)));
                ea = abs((xr-xz)/xr)*100;
                iter = iter+1;
                if iter == maxit
                    break
                end
                test = func(xl)*func(xr);
                if test < 0
                    xu = xr;
                elseif test > 0
                    xl = xr;
                else 
                    ea = 0;
                end
            end
        end
        root = xr;
        fx = func(root);
end