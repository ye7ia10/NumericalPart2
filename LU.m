classdef LU < handle
    %LU Summary of this class goes here
    %   Detailed explanation goes here
    properties
        eqns;
        L;
        U;
        ans;
        d; %has the forward substitutions
        b; %constant of the equations
    end
    
    methods
        function getLU(obj)
          [A,obj.b]=equationsToMatrix(sym(obj.eqns));   
          [n,m] = size(A);
          obj.L = zeros(n,m);
          obj.U = zeros(n,m);
          obj.d = zeros(n,1);
          obj.ans = zeros(n,1);
          for i = 1 : n
              %pivot
              obj.L(i,i) = 1;
              max  = abs(A(i,i));
              index = i;
              
              for l = i+1 : n
                  if A(l,i) > max
                    max = abs(A(l,i));
                    index = l;
                  end
              end
              temp=A(i,:);
              A(i,:)=A(index,:);
              A(index,:)=temp;

              temp=obj.b(i,:);
              obj.b(i,:)=obj.b(index,:);
              obj.b(index,:) = temp;
              
              temp=obj.L(i,:);
              obj.L(i,:)=obj.L(index,:);
              obj.L(index,:)=temp;
              
             
              for j = i + 1 : n
                row = A(i,:);
                pivot = A(j,i) / A(i,i);
                obj.L(j,i) = pivot;
                row = row * pivot;
                A(j,:) = A(j,:) - row;
                A(j,i) = 0;
             end
          end
          
          obj.L;
          obj.U = A;
          % forward substitution
          for i = 1 : n
              sum = 0;
              for j = 1 : n-1
                 sum = sum + obj.d(j) * obj.L(i,j);
              end
              sum = obj.b(i) - sum;
              obj.d(i) = sum;
          end
          % backword substitution
          for i = n : -1 : 1 
              sum = 0;
              for j = i + 1 : n
                  sum = sum + obj.U(i,j) * obj.ans(j);
              end
              sum = obj.d(i) - sum;
              obj.ans(i) = sum / obj.U(i,i)
          end
        end
    end
    
end
 
