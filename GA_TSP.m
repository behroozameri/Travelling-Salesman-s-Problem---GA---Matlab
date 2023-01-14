clc;
clear all;
close all;

load('Cities\WI29.mat');

Iteration = 10000;

if(BoradLenght <= 100)
    population = BoradLenght * 5 ;
else
    population = 500;
end

Mutationrate = 0.06;
AC = population * 2 ;
Cost = inf;
total_Count = 0;
iter = 0;
CostValue = zeros(1,Iteration);
CostMatrix = zeros(1,population);
ACM = zeros(BoradLenght,AC);
ACC = 0;
ACCM = zeros(1,AC);
ACCM(1,:) = inf;
MaxIter = 605;
MaxDiversity = 300;
DiversityRate = 75;
MaxMutationrate = 250;
MutationrateChange = 1.05;
MaxRepairAC = 200;

OldCost=inf;

for i=1:population
    PopulationList(i).flag = true;
    PopulationList(i).ChromosomeMatrix = zeros(BoradLenght,1);
end


Distances = MakeDistances(BoradLenght , Cities);


tic

PopulationList = InitialPopulation(PopulationList , BoradLenght , Distances , population);

while (iter < Iteration)
    
   
    iter = iter + 1;
     
    CostMatrix = CostFunctionALL(PopulationList , population , BoradLenght , Distances);
    
    [PopulationList , CostMatrix] = FindCross(PopulationList , CostMatrix , BoradLenght , population , Distances);
    
    [PopulationList , CostMatrix] = Swap(PopulationList , CostMatrix);    
    CostValue(iter) = CostMatrix(1,1);

    if(Cost > CostValue(iter))        
        Cost = CostValue(iter);
        total_Count = 0;          
    else                
        total_Count = total_Count + 1;        
        if(total_Count == MaxIter)
            fprintf(sprintf('break : iter %d , total_Count = %d', iter, total_Count));
            break;
        elseif(mod(total_Count,MaxRepairAC) == 0)            
            PopulationList = FindEqual(PopulationList , population , CostMatrix , BoradLenght , ACM , ACC);
            CostMatrix = CostFunctionALL(PopulationList , population , BoradLenght , Distances);
            fprintf('FindEqual : iter %d , total_Count = %d \n', iter, total_Count);
        elseif(mod(total_Count,MaxDiversity) == 0)            
            PopulationList = Diversity(PopulationList , CostMatrix , population , BoradLenght , ACC , ACM);
            CostMatrix = CostFunctionALL(PopulationList , population , BoradLenght , Distances);
            fprintf('Diversity : iter %d , total_Count = %d \n', iter, total_Count);
         elseif(mod(total_Count,MaxMutationrate)== 0)
            Mutationrate = Mutationrate * MutationrateChange ;
            fprintf('Mutationrate : iter %d , total_Count = %d \n', iter, total_Count);
        end
    end

    [ACM , ACC , ACCM] = RepairArchive(PopulationList , CostMatrix , ACM , ACC , ACCM , AC);
    
    PopulationList = CrossOver(PopulationList , BoradLenght , population , CostMatrix , Distances);    
    CostMatrix = CostFunctionALL(PopulationList , population , BoradLenght , Distances);
    
    [PopulationList , CostMatrix] = ApplyMutation(PopulationList , CostMatrix , population , BoradLenght , Mutationrate , Distances);

    if(OldCost>CostMatrix(1,1))
        fprintf('Total Distance %d = %d \n', iter, CostMatrix(1,1));
        OldCost = CostMatrix(1,1);
    end
    
end

toc


info=['TSP_GA | Results ,  Iteration : ',num2str(iter),' ,  population : ',num2str(population)];

figure('Name',info,'Numbertitle','off');

subplot(2,2,1:2);
plot(CostValue(1:iter));
title('Best Solution History');

subplot(2,2,3);
plot(Cities(:,1),Cities(:,2),'k.');
title('City Locations');

subplot(2,2,4);
list = PopulationList(1).ChromosomeMatrix;
list(BoradLenght+1) = list(1);
plot(Cities(list,1),Cities(list,2),'r.-');
title(sprintf('Total Distance = %d',CostMatrix(1,1)));

ShowChromosomeMatrix(1 , PopulationList , CostMatrix , BoradLenght , Mutationrate);