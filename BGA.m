function [best_fitness] = BGA
% Solving project selection problme using Binary GA

[con_matrix, column_cost] = ReadInData('sppnw41.txt');
%[con_matrix, column_cost] = ReadInData('sppnw42.txt');
%[con_matrix, column_cost] = ReadInData('sppnw43.txt');

num_bit = length(column_cost);

% Parameters
crossover_prob = 0.85;
mutation_prob = 1/num_bit;
num_ind = 40;
max_iter = 10000;
num_parents = floor(num_ind * 0.3);

% Generate initial solution
pop = []; 
fitness = [];
for i = 1:num_ind
    [total_cost, S_k] = Initialise(con_matrix,column_cost);
    pop=[pop;S_k];
end
% Calculate fitness for the initial population
[fitness, G_sum]=cal_fitness(pop,con_matrix,column_cost);

% Sort the individuals in the population according to their fitness values
[fitness, G_sum, sorted_idx] = stochastic_ranking_sort(fitness, G_sum);
pop = pop(sorted_idx,:);


termination_flag = false;
t=1;
while termination_flag == false   
    %  Select parents from the population based on their fitness using truncation selection   
    parents = pop(1:num_parents,:);
    offerspring = parents;
    
    % apply crossover    
    for j=1:floor(num_parents/2)
        if rand(1) <  crossover_prob
            % Randomly select two individuals from parents
            p1 = ceil(rand()*num_parents);
            p2 = ceil(rand()*num_parents);
            rand_parents1 = offerspring (p1,:);
            rand_parents2 = offerspring (p2,:);
            % Randomly select a bit as cross point
            q = ceil(rand()*(num_bit-1));            
            % Swap the bits beyond the cross point
            new_parent1 = [rand_parents1(1:q),rand_parents2(q+1:num_bit)];
            new_parent2 = [rand_parents2(1:q),rand_parents1(q+1:num_bit)];
            offerspring (p1,:) = new_parent1;
            offerspring (p2,:) = new_parent2;
        end
    end
    
    % apply mutation.  
    for j=1:num_parents
         % Select the bits for mutation
         rand_parent = offerspring (j,:);
         for index=1:num_bit
             if rand() < mutation_prob
                %mut = rand_parent(index);
                  if rand_parent(index) == 0
                      offerspring(j, index) = 1;
                     %rand_parent(index) = 1;
                  else
                     %rand_parent(index) = 0;
                      offerspring(j, index) = 0;
                  end
             end
         end
         % flip it
           
    end
    %Refinement using Heuristic improvement operator
    for k = 1:num_parents 
        offerspring(k,:) = Heuristic_improvement_operator(offerspring(k,:), con_matrix, column_cost);
    end

    temp_pop = [pop; offerspring];
    
    [fitness, G_sum] = cal_fitness(temp_pop,con_matrix,column_cost);    
    % Sort the individuals in the population according to their fitness values
    [fitness, G_sum, sorted_idx] = stochastic_ranking_sort(fitness, G_sum);
    % Replace the worst individuals, or select the top num_ind individuals from the new population  
    pop = temp_pop(sorted_idx(1:num_ind),:);    
    % Termination condiction 
    t=t+1;
    if(t>max_iter)
        termination_flag = true;
    end  
end
[fitness, G_sum]  = cal_fitness(pop,con_matrix,column_cost);
[fitness, G_sum, sorted_idx]  = stochastic_ranking_sort(fitness, G_sum);
pop=pop(sorted_idx(1:num_ind),:);
best_fitness=fitness(1);
best_G_sum=G_sum(1);

end


function [fitness, G_sum]  = cal_fitness(pop,con_matrix,column_cost)
fitness =[];
G_sum = [];
num_column=size(pop,1);
for i=1:num_column
    S_k = pop(i,:);
    total_cost=S_k*column_cost';
    fitness = [fitness,total_cost];
    
    temp2 =  (con_matrix*S_k')';
    constraint = sum(((temp2-1).^2)');
    G_sum = [G_sum,constraint];
end

end






