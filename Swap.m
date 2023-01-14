function [PopulationList , CostMatrix] = Swap(PopulationList , CostMatrix)

    [~, index] = min(CostMatrix(1,:));
    
    tmp = CostMatrix(1,index);
    CostMatrix(1,index) = CostMatrix(1,1);
    CostMatrix(1,1) = tmp;
    
    tmp = PopulationList(index);
    PopulationList(index) = PopulationList(1);
    PopulationList(1) = tmp;

end