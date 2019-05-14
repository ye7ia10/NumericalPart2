classdef GuassJordan < handle
    %GUASSJORDAN Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        eqns; %array of equations
        a;   %matrix of coff.
        b;   %matrix of constants.
        vars;
    end
    
    methods
         function  obj = GuassJordan(obj)
         end
         
       
       function obj = solve(obj) 
       [obj.a,obj.b]=equationsToMatrix(sym(obj.eqns));       
        % m is the row 
        % c is the column 
        [m,c]=size(obj.a); 
        j=1; %j th column 
        k=1; %k th row 
        n=1; % n th pivoting row 
        z=2;% Row operation always starts from 2 
        % Forward Elimination 
        % Shifting Loop for column operation 
        for i=1:c-1 
        
        % making pivoting to both arrays coff and const.
        max = abs(obj.a(n,n));
        index = n;
        for l = n+1 : m
            if abs(obj.a(l,n)) > max
                max = abs(obj.a(l,n));
                index = l;
            end
        end
        temp=obj.a(n,:); %starts forward elem.
        obj.a(n,:)=obj.a(index,:);
        obj.a(index,:)=temp;

        temp=obj.b(n,:);
        obj.b(n,:)=obj.b(index,:);
        obj.b(index,:)=temp;
        
        %Making each desired column component zero 
        for r=z:m 
        % Checking if any Lower triangle is Already Zero or not 
        if obj.a(r,j)==0 
        % If any is zero left the entire row as it is and skip the step 
        obj.a(r,:)=obj.a(r,:);obj.b(r,:)=obj.b(r,:); 
        else 
        obj.b(r,:)=((obj.a(r,j)/obj.a(k,j))*obj.b(n,:))-obj.b(r,:) 
        obj.a(r,:)=((obj.a(r,j)/obj.a(k,j))*obj.a(n,:))-obj.a(r,:) 
        end 
        end 
        k=k+1;% Changing row after completion of inner loop 
        n=n+1;% Changing the pivoting row 
        z=z+1;% Setting a new condition for inner loop 
        j=j+1;% Changing column after completion of inner loop 
        end 
        % Converting all the diagonal elements to one 
        for row=1:m 
        obj.b(row,:)=obj.b(row,:)/obj.a(row,row) 
        obj.a(row,:)=obj.a(row,:)/obj.a(row,row) 
        end 
        D=c; 
        for q=1:D-1 
        for rowJ=m-1:-1:1 
        if obj.a(rowJ,c)==0 
        obj.a(rowJ,:)=obj.a(rowJ,:);obj.b(rowJ,:)=obj.b(rowJ,:); 
        else 
        obj.b(rowJ,:)=obj.b(rowJ,:)-(obj.a(rowJ,c)*obj.b(m,:)) 
        obj.a(rowJ,:)=obj.a(rowJ,:)-(obj.a(rowJ,c)*obj.a(m,:)) 
        end 
        end 
        m=m-1; 
        c=c-1; 
        end 
       end
       
       function arr = getVar(obj,str)
            i = 1;
            n = length(str);
            obj.vars = {};
            while (i <= n)
                s =  '';
               if isletter(str(i))
                   while (i <= n)
                       i
                      if isletter(str(i))
                          s = strcat(s,str(i));
                          s
                          i = i+1;
                          continue;
                      end
                      if  ~isnan(str2double(str(i)))
                          s = strcat(s,str(i));
                          s
                          i = i+1;
                          continue;
                      end
                      if str(i) == ' '
                         s = strcat(s,str(i));
                         i = i+1;
                         continue;
                      else
                         break;
                      end
                      
                   end
                   obj.vars{end+1} = s;
               end
               i = i+1;
            end
            obj.vars 
       end
        
       
    end
    

    
end

