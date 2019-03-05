function [S_k] = Heuristic_improvement_operator(S_k, con_matrix, column_cost)

% number of rows
m = size(con_matrix,1);
% number of columns
n = size(con_matrix, 2);
%the number of columns that cover row i
w = (con_matrix*S_k');
%dummy set
T = S_k;

while sum(T) > 0
    % Find out which columns have not been covered
    uncovered_column_idx = find(T == 1);  
    % randomly select an uncovered column j
    j = uncovered_column_idx(randi(length(uncovered_column_idx)));
    T(j) = 0;
    
    beta_j = con_matrix(:,j);
    wi_in_beta_j = beta_j .* w;
    
    if ~ismember(1, wi_in_beta_j)
        S_k(j) = 0;
        wi_over_2 = find(wi_in_beta_j >= 2);
        for k = 1:length(wi_over_2)
        	w(wi_over_2(k)) = w(wi_over_2(k)) - 1;
        end  
    end
end
% dummy set all one
U = ones(1,m);
for k = 1:length(w)
    if w(k) == 0
        U(k) = 0;
    end
end
V = U;


while(sum(V)) < m
    % Find out which rows have not been covered
    uncovered_rows_idx = find(U == 0); 
    % randomly select an uncovered row i
    i = uncovered_rows_idx(randi(length(uncovered_rows_idx)));
    
    V(i) = 1;

    flag = 0;
    min_cost = 1000000;
    min_cost_j = 0;
    % Search for the column j ??i that satisfies ?j ? U, and minimises cj/|?j|
    for k = 1:n
        if ~ismember(2, con_matrix(:,k)' + U) && con_matrix(i,k) == 1
           if column_cost(k) < min_cost
               min_cost = column_cost(k) / sum(con_matrix(:,k));
               min_cost_j = k;
           end
           flag = 1;     
        end
    end   
    if flag == 1
        S_k(min_cost_j) = 1;
        
        beta_j = con_matrix(:, min_cost_j);
        
        for k = 1:length(w)
            if beta_j(k) == 1
                w(k) = w(k) + 1;
            end
        end
        
        for k = 1:length(beta_j)
            if beta_j(k) == 1
                U(k) = 1;
                V(k) = 1;
            end
        end        
    end    
end
end

