%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Parameter specifications
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

populationSize = 100;              % Do NOT change
maximumVariableValue = 5;          % Do NOT change: (x_i in [-a,a], where a = maximumVariableValue)
numberOfGenes = 50;                % Do NOT change
numberOfVariables = 2;  	       % Do NOT change

tournamentSize = 2;                % Changes allowed
tournamentProbability = 0.75;      % Changes allowed (= pTour)
crossoverProbability = 0.8;        % Changes allowed (= pCross)
mutationProbability = 0.02;        % Changes allowed. (Note: 0.02 <=> 1/numberOfGenes)
numberOfGenerations = 2000;        % Changes allowed.

[maximumFitness, bestVariableValues] = RunFunctionOptimization(populationSize, numberOfGenes, numberOfVariables, maximumVariableValue, tournamentSize, ...
                                        tournamentProbability, crossoverProbability, mutationProbability, numberOfGenerations);

sprintf('Fitness: %d, x(1): %0.10f, x(2): %0.10f, g: %0.010f', maximumFitness, bestVariableValues(1), bestVariableValues(2),CalculateG(bestVariableValues))

function g = CalculateG(x)
    x1 = x(1);
    x2 = x(2);

    gNumerator1 = (1.5-x1+x1*x2)^2;
    gNumerator2 = (2.25-x1+x1*x2^2)^2;
    gNumerator3 = (2.625-x1+x1*x2^3)^2;

    g = gNumerator1+gNumerator2+gNumerator3;
end

