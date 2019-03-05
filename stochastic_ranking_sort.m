function [fitness, G_sum, idx] = stochastic_ranking_sort(fitness, G_sum)
% Bubble sort
mu = length(fitness);
Pf = .45;
idx = [1:mu];

for i = 1:mu
    % Iterate through fitness
    for j = 2:mu
        U = rand(1);
        % Swap elements in wrong order
        % There is no constraint violation or U < Pf
        % Please complete the implementation 
        if G_sum(j-1)==0 && G_sum(j)==0 ||U<=Pf
            if fitness(j)<fitness(j-1)
                fitness = swap(fitness,j,j-1);
                G_sum = swap(G_sum,j,j-1);
                idx = swap(idx,j,j-1);    
            end
        else
            if G_sum(j)<G_sum(j-1)
                fitness = swap(fitness,j,j-1);
                G_sum = swap(G_sum,j,j-1);
                idx = swap(idx,j,j-1);    
            end
        end        
     end
end
end
function fitness = swap(fitness,i,j)
% Swap fitness(i) and fitness(j)
% Note: In practice, fitness xhould be passed by reference

val = fitness(i);
fitness(i) = fitness(j);
fitness(j) = val;

end

