# Solving-Air-Crew-Scheduling-Problems-using-Genetic-Algorithms
Advanced Aspects of Nature Inspired Search and Optimisation Assignment
Aim:
You are required to implement a binary genetic algorithm to solve three airline crew scheduling problems. We will follow [1] to implement several specific operators such as initialisation, mutation and refinement operators to obtained good results. We will also implement the stochastic ranking method [2] for constraint handling. The problems we will solve are sppnw41, sppnw42 and sppnw43 in OR-Library:

http://people.brunel.ac.uk/~mastjjb/jeb/orlib/files/sppnw41.txt

http://people.brunel.ac.uk/~mastjjb/jeb/orlib/files/sppnw42.txt

http://people.brunel.ac.uk/~mastjjb/jeb/orlib/files/sppnw43.txt

Requirements:
Similar to the previous two CAs, you can use any programming languages to complete this assignment. However, if you want to use languages other than Matlab/Octave, you should make your program executable/runnable. For example, if you use Java, you need to compile it. If you use Python, make sure it can be run in a python online IDE such as TutorialPointLinks to an external site.
Implement the pseudo-random initialisation method (Algorithm 2, p341 in [1]) (1 point).  Note: this algorithm is similar to the stochastic local search algorithm for the set cover problem. Please see my slides on 8th Feb, page 15. You implement this initialisation method by modifying my source code (StochasticSetCover.m) in this zip file. 
Implement the stochastic ranking method as described in [2] for constraint handling (1 point). 
Implement the heuristic improvement operator (Algorithm 1, p331 in [1]) (3 points).
Write a report to report your results. In the report you are required to [5 points]:
Introduce the Genetic algorithm and its operators. You need to use a flowchart and pseudo-code to explain the algorithm. (2 points)
For each benchmark problem, list all the average result and standard deviations obtained over 30 independent runs of the algorithms (1 point)
Discuss the similarity and difference between the ranking replacement method in [1] and the stochastic ranking method in [2] (2 points)
Please submit your report with your source code in a zip file. 
 

Reference:
[1] P.C. Chu, J.E. Beasley, Constraint Handling in Genetic Algorithms: The Set Partitioning Problem, Journal of Heuristics, 11: 323–357 (1998). Download the paper from here.Preview the document

[2] T.P. Runarsson, X. Yao Stochastic ranking for constrained evolutionary optimization, IEEE Trans. on Evolutionary Computation, 4(3): 284-294 (2000). Download the paper from here. (Links to an external site.)Links to an external site.

 
