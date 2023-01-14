function [PopulationList , CostMatrix] = ApplyMutation(PopulationList , CostMatrix , population , BoradLenght , Mutationrate , Distances)    

    NumberOfMutation = ( Mutationrate * population )  ;
    
    for k = 1 : NumberOfMutation
        
        randomChromosome = ceil(2 + ( population - 2 ) .* rand());
        
        newCh = Mutation(PopulationList(randomChromosome).ChromosomeMatrix,BoradLenght,Distances);
        
        t = CostFunction(newCh(:) , BoradLenght , Distances);
        if(t < CostMatrix(1,randomChromosome))
            PopulationList(randomChromosome).ChromosomeMatrix = newCh;
            CostMatrix(1,randomChromosome) = t;
        end
    end
end

