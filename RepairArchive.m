function [ACM , ACC , ACCM] = RepairArchive(PopulationList , CostMatrix , ACM , ACC , ACCM , AC)
    
    tmp = CostMatrix;
    i = 0;
    while(i<10)
        [val, index] = min(tmp(1,:));
        ind = find(ACCM(1,:) == val);
        [~, b] = size(ind);
        if( b == 0 )
            if(ACC<AC)
                ACC=ACC+1;
                ACM(:,ACC)= PopulationList(index).ChromosomeMatrix(:,1);
                ACCM(1,ACC)=val;                                                                            
                i=i+1;
            else
                [v, ind] = max(ACCM(1,:));              
                if(v > val)
                    ACM(:,ind)= PopulationList(index).ChromosomeMatrix(:,1);
                    ACCM(1,ind)=val;
                    i=i+1;
                else
                    i=10;
                end
            end
        end
        tmp(index)=inf;
    end
end