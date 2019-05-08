
function WriteFile(object,sm)
    
    
    fileID = fopen('output.txt','w');
    % LU decomposition
%     object.eqns = double(object.eqns);
%     fprintf(fileID,'Equations \r\n');
%         for ii = 1:size(object.eqns,1)
%             fprintf(fileID,'%s\t',object.eqns(ii,:));
%             fprintf(fileID,'\r\n');
%         end
    if sm == 1
        object.ans = double(object.ans);
        fprintf(fileID,'Roots \r\n');
        for ii = 1:size(object.ans,1)
            fprintf(fileID,'%g\t',object.ans(ii,:));
            fprintf(fileID,'\r\n');
        end
%         fprintf(fileID,'%s  \r\n',object.eqns(1:2));
        object.L = double(object.L);
        fprintf(fileID,'\r\n');
        fprintf(fileID,'Lower matrix \r\n');
        for ii = 1:size(object.L,1)
            fprintf(fileID,'%g\t',object.L(ii,:));
            fprintf(fileID,'\r\n');
        end
        
        object.U = double(object.U);
        fprintf(fileID,'\r\n');
        fprintf(fileID,'Upper matrix \r\n');
        for ii = 1:size(object.U,1)
            fprintf(fileID,'%f\t',object.U(ii,:));
            fprintf(fileID,'\r\n');
        end

    end
    %x+y-2  x-y-4
    if sm == 2
        object.roots = double(object.roots);
        fprintf(fileID,'Roots \r\n');
        for ii = 1:size(object.roots,1)
            fprintf(fileID,'%g\t',object.roots(ii,:));
            fprintf(fileID,'\r\n');
        end
        
        object.data = double(object.data);
        fprintf(fileID,'Iterations \r\n');
        for ii = 1:size(object.data,1)
            fprintf(fileID,'%g\t',object.data(ii,:));
            fprintf(fileID,'\r\n');
        end
        fprintf(fileID,'Time: \r\n');
        fprintf(fileID,'%f\t',object.ExTime);
        fprintf(fileID,'\r\n');
        
        fprintf(fileID,'precession: \r\n');
        fprintf(fileID,'%f\t',object.precession);
        fprintf(fileID,'\r\n');
        
        
    end
    
    if sm == 3
        object.x = double(object.x);
        fprintf(fileID,'Roots \r\n');
        for ii = 1:size(object.x,1)
            fprintf(fileID,'%g\t',object.x(ii,:));
            fprintf(fileID,'\r\n');
        end
        
        object.a = double(object.a);
        fprintf(fileID,'Coefficient \r\n');
        for ii = 1:size(object.a,1)
            fprintf(fileID,'%g\t',object.a(ii,:));
            fprintf(fileID,'\r\n');
        end
        
        object.b = double(object.b);
        fprintf(fileID,'Conistants \r\n');
        for ii = 1:size(object.b,1)
            fprintf(fileID,'%g\t',object.b(ii,:));
            fprintf(fileID,'\r\n');
        end
    end
    if sm == 4
        object.b = double(object.b);
        fprintf(fileID,'Roots \r\n');
        for ii = 1:size(object.b,1)
            fprintf(fileID,'%g\t',object.b(ii,:));
            fprintf(fileID,'\r\n');
        end
        
        object.a = double(object.a);
        fprintf(fileID,'Coefficient \r\n');
        for ii = 1:size(object.a,1)
            fprintf(fileID,'%g\t',object.a(ii,:));
            fprintf(fileID,'\r\n');
        end
        
        
    end
    fclose(fileID);

end