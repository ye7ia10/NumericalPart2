classdef FileReader<handle
    %UNTITLED3 Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        index = 0;
        objects= [];
        funs={};
        method;
        boundry;
        r = 0;
        eps = .00001;
        NomIt = 50;
        init =[];
        MethodNum;
        numOfEqu=0;
    end
    
    methods
        function  read(obj,filename)
            fid = fopen(filename,'rt');
            while true
                thisline = fgetl(fid)
                thisline
                if thisline ~= -1
                    x = str2num(thisline);
                end
                if ~ischar(thisline); break; end  %end of file

                if obj.index == 0
                    obj.numOfEqu = x;
                end
                
                if obj.index == 1
                        
                        obj.funs{end+1} = thisline;
                    for ii=1:obj.numOfEqu-1
                        thisline = fgetl(fid)
                        e = thisline;
                        obj.funs{end+1} = thisline;
                        obj.index = obj.index + 1;
                    end
                end
                %check the names
                if obj.index == obj.numOfEqu+1
                    if strcmp(thisline,'Gaussian-elimination')
                        obj.method = 'Gauss';
                        obj.r = 2;
                        obj.MethodNum = 2;
                    end
                    if strcmp(thisline,'Gaussian-jordan')
                        obj.method = 'GuassJordan'; 
                        obj.r = 2;
                        obj.MethodNum = 3;
                    end
                    if strcmp(thisline,'Gauss-seidel')
                        obj.method = 'GaussSeidel';
                        obj.r = 4;
                        obj.MethodNum = 5;
                    end
                    if strcmp(thisline,'LU-decomposition')
                         obj.method = 'LU';  
                         obj.r = 1;
                         obj.MethodNum = 4;
                    end
                end
                if obj.index == obj.numOfEqu+2
                   obj.boundry = x;
                   obj.init=[];
                   obj.init=reshape(x,[obj.numOfEqu,1]);
                   
                end
                if obj.index == obj.numOfEqu+3
                   espOrmax = x(1);
                   if espOrmax < 1
                       obj.eps = espOrmax;
                       %obj.eps = str2double(obj.eps);
                   else
                       obj.NomIt = espOrmax;
                   end

                end
                  obj.index = obj.index + 1;
            end
             fclose(fid);
        end
    end
    
end