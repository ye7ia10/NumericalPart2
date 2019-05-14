classdef Gauss < handle
    %UNTITLED Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        x = [] ;
        a = [] ;
        b = [] ;
        eqns;
        n;
        tol = 0.00001;
        er = 0;
    end
    
    methods
        function obj = solve(obj)
            obj.n = length(obj.eqns)
            s=zeros(1,obj.n);
            [obj.a,obj.b]=equationsToMatrix(sym(obj.eqns)); 
            obj.a
            obj.b
            
            for i=1:obj.n
                s(i) = abs(obj.a(i,1));
                for j=2:obj.n
                    if (abs(obj.a(i,j))>s(i))
                        s(i) = abs(obj.a(i,j));
                    end
                end
            end
            obj.Eliminate(s);
            if ~(obj.er==-1)
                obj.Subtitute();
            end
        end
    end
    
    methods(Access = private)
        function obj = Eliminate(obj,s)
            for k=1:obj.n-1
                obj.Pivot(s,k);
                if (abs(obj.a(k,k)/s(k))<obj.tol)
                    obj.er=-1;
                    return;
                end
                for i=k+1:obj.n
                    factor = obj.a(i,k)/obj.a(k,k)
                    obj.a(i,k) = 0;
                    for j=k+1:obj.n
                        obj.a(i,j) = obj.a(i,j) - factor * obj.a(k,j);
                    end
                    obj.b(i) = obj.b(i) - factor * obj.b(k);
                end
            end
            if (abs(obj.a(obj.n,obj.n)/s(obj.n))<obj.tol)
                obj.er=-1;
            end
        end
        
        function obj = Pivot(obj,s,k)
            p=k;
            big = abs(obj.a(k,k)/s(k))
            for i = k+1:obj.n
                dummy = abs(obj.a(i,k)/s(k))
                if (dummy > big)
                    big = dummy;
                    p = i;
                end
            end
            if ~(p==k)
                for j=k:obj.n
                    dummy = obj.a(p,j);
                    obj.a(p,j) = obj.a(k,j);
                    obj.a(k,j) = dummy;
                end
                dummy = obj.b(p);
                obj.b(p) = obj.b(k);
                obj.b(k) = dummy;
                
                dummy = s(p);
                s(p) = s(k);
                s(k) = dummy;
            end
        end
        function obj = Subtitute(obj)
            obj.x(obj.n) = obj.b(obj.n) / obj.a(obj.n,obj.n);
            i = obj.n-1;
            while (i>0)
                sum=0;
                for j=i+1:obj.n
                    sum = sum + obj.a(i,j) * obj.x(j);
                end
                obj.x(i) = (obj.b(i)-sum)/obj.a(i,i);
                i = i-1;
            end
        end
    end
end


%
%     // Assume arrays start with index 1 instead of 0.
% // a: Coef. of matrix A; 2-D array
% // b: Coef. of vector b; 1-D array
% // n: Dimension of the system of equations
% // x: Coef. of vector x (to store the solution)
% // tol: Tolerance; smallest possible scaled pivot allowed.
% // er: Pass back -1 if matrix is singular. (Reference var.)
% Gauss(a, b, n, x, tol, er) {
% Declare s[n] // as an n-element array for storing scaling factors
% // si = the largest coef. of row i.
% for i = 1 to n
% s
% i = abs(ai,1)
% for j = 2 to n
% if (abs(ai,j) > si)
% s
% i = abs(ai,j)
% Eliminate(a, s, n, b, tol, er) // Forward Elimination
% if (er ? -1) // If not singular
% Substitute(a, n, b, x) // Back Substitution
% }
%
% // Partial Pivoting
% Pivot(a, b, s, n, k) {
% p = k // Assume row k is the pivot row
% // Find the largest scaled coefficient in column k
% big = abs(ak,k / sk)
% for i = k+1 to n {
% dummy = abs(ai,k / si)
% if (dummy > big) {
% big = dummy
% p = i // Record new pivoting row
% }
% }
% // Next: Swap row p and row k if p != k
% // Continue next page
% if (p != k) {
% // Swap row p and row k
% for j = k to n {
% dummy = ap,j
% a
% p,j = ak,j
% a
% k,j = dummy
% }
% // swap bp and bk
% dummy = bp
% b
% p = bk
% b
% k = dummy
% // swap sp and sk
% dummy = sp
% s
% p = bk
% s
% k = dummy
% }
% }
%
% Eliminate(a, b, n, x, tol, er) {
% for k = 1 to n-1 {
% Pivot(a, b, s, n, k) // Partial Pivoting
% if (abs(ak,k/sk) < tol) { // Check for singularity
% er = -1;
% return;
% }
% for i = k+1 to n
% factor = a
% i,k / ak,k
% for j = k+1 to n
% a
% i,j = ai,j – factor * ak,j
% b
% i = bi – factor * bk
% }
% if (abs(an,n/sn) < tol) // Check for singularity
% er = -1;
% }
%
% // Back Subsitution
% Substitute(a, n, b, x) {
% x
% n = bn / an,n
% for i = n-1 downto 1 {
% sum = 0
% for j = i+1 to n
% sum = sum + a
% i,j * xj;
% x
% i = (bi – sum) / ai,i
% }
% }

