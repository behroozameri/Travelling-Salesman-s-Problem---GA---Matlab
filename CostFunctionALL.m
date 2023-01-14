function CostMatrix = CostFunctionALL(PopulationList , population , BoradLenght , Distances)
    for i = 1 : population
        if(PopulationList(i).flag == true)
            CostMatrix(1,i) = CostFunction(PopulationList(i).ChromosomeMatrix(:) , BoradLenght , Distances); 
            PopulationList(i).flag = false;
        end
    end
end