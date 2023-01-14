function PopulationList = Diversity(PopulationList , CostMatrix , population , BoradLenght , ACC , ACM)

    [PopulationList , ~] = PopulationSort( PopulationList , CostMatrix , 1 , population );
            
    TotalIndex = ( ACC / 3 - population /5 ) / 2;
    TotalIndex = round(TotalIndex);
    
    for index = 0 : TotalIndex    
        
        % ---- Make DomainanceMatrix -------
        
        DomainanceMatrix = MakeDomainanceMatrix(BoradLenght, ACM, ACC);
        
        % ----- Generate AC with Algorithm A -----
        
        AC_A = MakeAC_A( DomainanceMatrix , BoradLenght );
        PopulationList(population - index).ChromosomeMatrix = AC_A(:,1);
        PopulationList(population - index).flag=true;        
       
        % ----- Generate AC with Algorithm B -----
        
        AC_B = MakeAC_B( DomainanceMatrix , BoradLenght );        
        PopulationList(population - index - TotalIndex ).ChromosomeMatrix = AC_B(:,1);
        PopulationList(population - index - TotalIndex ).flag = true;
        
    end 
end