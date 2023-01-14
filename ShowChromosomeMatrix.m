function ShowChromosomeMatrix(index , PopulationList , CostMatrix , BoradLenght , Mutationrate)
    
    tmp = PopulationList(index).ChromosomeMatrix;
    tmp(BoradLenght+1) = tmp(1);
    disp 'Mutation = ';disp(Mutationrate)
    disp 'Tour = ';disp(tmp)
    disp 'Cost = ';disp(CostMatrix(1,1))
end