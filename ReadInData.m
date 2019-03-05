function [con_matrix, column_cost] = ReadInData(fname)

% Open file
fid = fopen(fname,'rt');


tline = fgets(fid);
disp(tline);

matrixsize = str2num(tline);
con_matrix = zeros(matrixsize);
column_cost = zeros(1, matrixsize(2));

n=1;
while ischar(tline)
    tline = fgets(fid);
    if(tline==-1)
        break;
    end
    x = str2num(tline);
    column_cost(n) = x(1,1);
    for j=1:x(2)
       con_matrix(x(2+j),n) = 1;
    end
    n=n+1;
end

fclose(fid);

end





