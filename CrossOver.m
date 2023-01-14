function PopulationList = CrossOver(PopulationList , BoradLenght , population , CostMatrix , Distances)

    TempNewPopulation = PopulationList;

    for index = 4:4:population-4
        
        costtmp1 = CostMatrix(1,index-3:index-2);
        costtmp2 = CostMatrix(1,index-1:index);
        poptmp1 = PopulationList(index-3:index-2);
        poptmp2 = PopulationList(index-1:index);
        [~, c1] = min(costtmp1);
        [~, c2] = min(costtmp2);
        
        TempNewPopulation(index-3)= poptmp1(c1);
        TempNewPopulation(index-2)= poptmp2(c2);
        
        
        child_1 = Crossover_Clockwise(poptmp1(c1).ChromosomeMatrix , poptmp2(c2).ChromosomeMatrix , BoradLenght , Distances);
        child_2 = Crossover_CounterClockwise(poptmp1(c1).ChromosomeMatrix , poptmp2(c2).ChromosomeMatrix , BoradLenght , Distances);

               
        TempNewPopulation(index-1).ChromosomeMatrix = child_1;
        TempNewPopulation(index-1).flag = true;  
        TempNewPopulation(index).ChromosomeMatrix = child_2;
        TempNewPopulation(index).flag = true;  
        
    end
    
    PopulationList = TempNewPopulation; 

end