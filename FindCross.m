function [PopulationList , CostMatrix] = FindCross(PopulationList , CostMatrix , BoradLenght , population , Distances)

    for index = 1 : population
        
        ins_pts = sort( fix ( 2 + ( BoradLenght - 2  ) .* rand(1,2)));
        I = ins_pts(1);
        J = ins_pts(2);
        
        a = Distances(PopulationList(index).ChromosomeMatrix(I),PopulationList(index).ChromosomeMatrix(I-1));
        a = a + Distances(PopulationList(index).ChromosomeMatrix(J+1),PopulationList(index).ChromosomeMatrix(J));
        
        b = Distances(PopulationList(index).ChromosomeMatrix(J),PopulationList(index).ChromosomeMatrix(I-1));
        b = b + Distances(PopulationList(index).ChromosomeMatrix(J+1),PopulationList(index).ChromosomeMatrix(I));
        
        if(a > b)
            tmp = PopulationList(index).ChromosomeMatrix';
            tmp(I+1:J-1)=fliplr(tmp(I+1:J-1));
            tmp = tmp';
            t = CostFunction(tmp(:) , BoradLenght , Distances);
            if(t < CostMatrix(1,index))
                PopulationList(index).ChromosomeMatrix = tmp;
                CostMatrix(1,index) = t;
            end
        else        
            I = ins_pts(2);
            J = ins_pts(1);
            
            a = Distances(PopulationList(index).ChromosomeMatrix(I),PopulationList(index).ChromosomeMatrix(I-1));
            a = a + Distances(PopulationList(index).ChromosomeMatrix(J+1),PopulationList(index).ChromosomeMatrix(J));
        
            b = Distances(PopulationList(index).ChromosomeMatrix(J),PopulationList(index).ChromosomeMatrix(I-1));
            b = b + Distances(PopulationList(index).ChromosomeMatrix(J+1),PopulationList(index).ChromosomeMatrix(I));
        
            if(a > b)
                tmp = PopulationList(index).ChromosomeMatrix';
                tmp(I+1:J-1)=fliplr(tmp(I+1:J-1));
                tmp = tmp';
                t = CostFunction(tmp(:) , BoradLenght , Distances);
                if(t < CostMatrix(1,index))                    
                    PopulationList(index).ChromosomeMatrix = tmp;
                    CostMatrix(1,index) = t;
                end
            end
        end
    end
end
