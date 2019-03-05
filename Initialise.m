function [total_cost, S_k] = Initialise(con_matrix,column_cost)
% number of rows
m = size(con_matrix,1);
% number of columns
n = size(con_matrix, 2);
% Initiate I to indicate all rows are not cover (I_i = 0 means the i_th row is not covered)
I = zeros(1,m);
% S_k is the solution, i.e., F_j=1 means the j_th column is selcted, F_j=0,otherwise
S_k = zeros(1,n);
U=I;
    
while sum(U) < m
     % Find out which rows have not been covered
     uncovered_rows_idx = find(I==0); 
     % randomly select an uncovered row i
     i_idx = uncovered_rows_idx(randi(length(uncovered_rows_idx)));   
     diff = U - I;
     j_idx=[];
     exists=0;
    %c is columns number 
     for c=1:n
         if ismember(2,con_matrix(:,c)'+diff)==0 && con_matrix(i_idx,c) == 1
             j_idx=[j_idx,c];
             exists=1;
         end
     end
    % randomly select an uncovered columns j
     if exists==1
         j_idx=j_idx(randperm(length(j_idx)));
         j_random=j_idx(1);
         S_k(1,j_random)=1;
         index = find(con_matrix(:,j_random) == 1);
         for k = 1:length(index)
             U(index(k)) = U(index(k))+1;
         end
     else
         U(i_idx)=1;
     end
end

 total_cost = S_k*column_cost';
 temp2 =  (con_matrix*S_k')';
 G_sum = sum(((temp2-1).^2)');


