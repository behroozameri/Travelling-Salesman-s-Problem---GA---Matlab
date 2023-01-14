function PopulationList = Repair_Population_with_AC(PopulationList , population , BoradLenght , CostMatrix , ACM , ACC)
    
    index = population;
    while( CostMatrix(index) == inf )
        
        % ---- Make DomainanceMatrix -------
        
        DomainanceMatrix = MakeDomainanceMatrix(BoradLenght, ACM, ACC);
        
        % ----- Generate AC with Algorithm A -----
        
        AC_A = MakeAC_A( DomainanceMatrix , BoradLenght );
        PopulationList(index).ChromosomeMatrix = AC_A(:,1);
        PopulationList(index).flag = true;
        
        index = index - 1;
        
    end 
end