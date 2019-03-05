[best_fitness] = BGA;
fitness = [best_fitness];

for a=1:29
    
    fitness=[fitness,BGA];
    
end
plot(fitness)
fitness_average=mean(fitness)
fitness_std=std(fitness)