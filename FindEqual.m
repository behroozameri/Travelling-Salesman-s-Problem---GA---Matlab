function PopulationList = FindEqual(PopulationList , population , CostMatrix , BoradLenght , ACM , ACC)
    for i = 1 : population
        if(CostMatrix(i) ~= inf)
            for j = i + 1 : population
                if(CostMatrix(i) == CostMatrix(j))
                    flag = CheckSame(PopulationList(i).ChromosomeMatrix(:,1), PopulationList(j).ChromosomeMatrix(:,1), BoradLenght);
                    if(flag == 1)
                        CostMatrix(j)=inf;
                    end
                end
            end
        end
    end    
    PopulationList = Repair_Population_with_AC(PopulationList , population , BoradLenght , CostMatrix , ACM , ACC);    
end