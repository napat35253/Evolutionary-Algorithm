%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Parameter specifications
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

numberOfRuns = 100;                % Do NOT change
populationSize = 100;              % Do NOT change
maximumVariableValue = 5;          % Do NOT change (x_i in [-a,a], where a = maximumVariableValue)
numberOfGenes = 50;                % Do NOT change
numberOfVariables = 2;		       % Do NOT change
numberOfGenerations = 300;         % Do NOT change
tournamentSize = 2;                % Do NOT change
tournamentProbability = 0.75;      % Do NOT change
crossoverProbability = 0.8;        % Do NOT change
mutationProbabilityArray = [0 0.02 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Batch runs
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Define more runs here (pMut < 0.02) ...
for i=1:size(mutationProbabilityArray,2)
    mutationProbability = mutationProbabilityArray(i);
    sprintf('Mutation rate = %0.5f', mutationProbability)
    maximumFitnessList002 = zeros(numberOfRuns,1);
    for i = 1:numberOfRuns 
        [maximumFitness, bestVariableValues]  = RunFunctionOptimization(populationSize, numberOfGenes, numberOfVariables, maximumVariableValue, tournamentSize, ...
                                       tournamentProbability, crossoverProbability, mutationProbability, numberOfGenerations);
%         sprintf('Run: %d, Score: %0.10f', i, maximumFitness)
    maximumFitnessList002(i,1) = maximumFitness;
    end


% ... and here (pMut > 0.02)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Summary of results
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Add more results summaries here (pMut < 0.02) ...

    average002 = mean(maximumFitnessList002);
    median002 = median(maximumFitnessList002);
    std002 = sqrt(var(maximumFitnessList002));
    sprintf('PMut = %0.5f: Median: %0.10f, Average: %0.10f, STD: %0.10f, g: %0.10f',mutationProbability, median002, average002, std002, CalculateG(bestVariableValues))

end
% ... and here (pMut > 0.02)

function g = CalculateG(x)
    x1 = x(1);
    x2 = x(2);

    gNumerator1 = (1.5-x1+x1*x2)^2;
    gNumerator2 = (2.25-x1+x1*x2^2)^2;
    gNumerator3 = (2.625-x1+x1*x2^3)^2;

    g = gNumerator1+gNumerator2+gNumerator3;
end