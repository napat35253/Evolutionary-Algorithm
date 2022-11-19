% Note: Each component of x should take values in [-a,a], where a = maximumVariableValue.

function x = DecodeChromosome(chromosome,numberOfVariables,maximumVariableValue)

    k = (size(chromosome,2)/numberOfVariables);
    x = zeros(1,numberOfVariables);
    g = 1; %indexOfGenes
    for i = 1:numberOfVariables

        for j = 1:k
            x(i) = x(i) + chromosome(g)*2^(-j);
            g = g+1;
        end

        x(i) = -maximumVariableValue + ((2*maximumVariableValue)/(1- 2^(-k))*x(i));

    end
end

