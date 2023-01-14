function [PopulationList , CostMatrix] = PopulationSort( PopulationList , CostMatrix , low , high )
    if(low < high)
        mid=fix((low+high)/2);
        [PopulationList , CostMatrix] = PopulationSort(PopulationList , CostMatrix , low , mid);
        [PopulationList , CostMatrix] = PopulationSort(PopulationList , CostMatrix , mid+1 , high);
        [PopulationList , CostMatrix] = Merge(PopulationList , CostMatrix , low , mid+1 , high);
    end
end

function [PopulationList , CostMatrix] = Merge( PopulationList , CostMatrix , low , mid , high )
    
    left_end=mid-1;
    tmp_pos=low;
    num_elements=high-low+1;
    
    
    while((low<=left_end) && (mid<=high))
        if(CostMatrix(1,low) <= CostMatrix(1,mid))
            temp(tmp_pos)=PopulationList(low);
            tmp_cost(tmp_pos)=CostMatrix(1,low);
            tmp_pos=tmp_pos+1;
            low=low+1;
        else
            temp(tmp_pos)=PopulationList(mid);
            tmp_cost(tmp_pos)=CostMatrix(1,mid);
            tmp_pos=tmp_pos+1;
            mid=mid+1;
        end
    end
        
    while(low <= left_end)
        temp(tmp_pos)=PopulationList(low);
        tmp_cost(tmp_pos)=CostMatrix(1,low);
        tmp_pos=tmp_pos+1;
        low=low+1;
    end
        
    while(mid<=high)
        temp(tmp_pos)=PopulationList(mid);
        tmp_cost(tmp_pos)=CostMatrix(1,mid);
        tmp_pos=tmp_pos+1;
        mid=mid+1;
    end
       
    for i=1:num_elements
        PopulationList(high)=temp(high);
        CostMatrix(1,high)=tmp_cost(high);
        high=high-1;
    end
        
end