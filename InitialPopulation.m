function PopulationList = InitialPopulation(PopulationList , BoradLenght , Distances , population)
    INDEX = 1;    
    [INDEX , PopulationList] = Init_Heuristics(PopulationList , BoradLenght , Distances , INDEX);
    [INDEX , PopulationList] = Init_Greedy(PopulationList , BoradLenght , Distances , INDEX);
    PopulationList = Init_Random(PopulationList , BoradLenght , population , INDEX);
    
end

%%  -- Init_Heuristics --

function [INDEX , PopulationList] = Init_Heuristics(PopulationList , BoradLenght , Distances , INDEX)
    
    cost = zeros(BoradLenght);

    tmp = Distances;
    for index = 1 : BoradLenght
        tmp(index,index)=inf;
    end
    
    temp = tmp ;    
        
    for index = 1 : BoradLenght
        List(index).ChromosomeMatrix(1,1) = index;
        MatrixTmp = zeros(1,BoradLenght);
        MatrixTmp(index) = 1;
        ind = index;
        j=2;
        while(j <= BoradLenght)
            [~, in] = min(tmp(ind,:));
            if(MatrixTmp(in) ~= 1)
                MatrixTmp(in) = 1;
                List(index).ChromosomeMatrix(j,1) = in;
                ind = in;
                j = j + 1;
            else
                tmp(ind,in)=inf;
            end
        end   
        tmp = temp;        
    end
    
    
    if(BoradLenght <= 100 )
        for i = 1 : BoradLenght
            PopulationList(INDEX).ChromosomeMatrix(:) = List(i).ChromosomeMatrix(:);
            INDEX = INDEX + 1;
        end
    else
        for i = 1 : BoradLenght
            cost(i,1) = CostFunction(List(i).ChromosomeMatrix(:)); 
        end
        for i = 1 : 100
            [~,dex] = min(cost(:,1));
            PopulationList(INDEX).ChromosomeMatrix(:) = List(dex).ChromosomeMatrix(:);
            INDEX = INDEX + 1;
            cost(index)=inf;
        end
    end   
    
end

%%  -- Init_Greedy --

function [INDEX , PopulationList] = Init_Greedy(PopulationList , BoradLenght , Distances , INDEX)
    
    cost = zeros(BoradLenght);

    tmp = Distances;
    for index = 1 : BoradLenght
        tmp(index,index)=inf;
    end
        
    for index = 1 : BoradLenght
        List(index).ChromosomeMatrix(1,1) = index;
        MatrixTmp = zeros(1,BoradLenght);
        MatrixTmp(index) = 1;
        j=2;
        while(j <= BoradLenght)
            [~, in] = min(tmp(index,:));
            if(MatrixTmp(in) ~= 1)
                MatrixTmp(in) = 1;
                tmp(index,in) = inf;
                List(index).ChromosomeMatrix(j,1) = in;
                j=j+1;
            end
        end
    end
    
    if(BoradLenght <= 100 )
        for i = 1 : BoradLenght
            PopulationList(INDEX).ChromosomeMatrix(:) = List(i).ChromosomeMatrix(:);
            INDEX = INDEX + 1;
        end
    else
        for i = 1 : BoradLenght
            cost(i,1) = CostFunction(List(i).ChromosomeMatrix(:)); 
        end
        for i = 1 : 100
            [~,dex] = min(cost(:,i));
            PopulationList(INDEX).ChromosomeMatrix(:) = List(dex).ChromosomeMatrix(:);
            INDEX = INDEX + 1;
            cost(index)=inf;
        end
    end   
    
end

%%  -- Init_Random -- 

function PopulationList = Init_Random(PopulationList , BoradLenght , population , INDEX)
    
    for index = INDEX : population
        PopulationList(INDEX).ChromosomeMatrix = randperm(BoradLenght)';        
        INDEX = INDEX + 1;
    end
end