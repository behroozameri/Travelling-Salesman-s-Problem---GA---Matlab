function dis = CostFunction(ChromosomeMatrix , BoradLenght , Distances)
    dis = 0;
    for city = 2:BoradLenght
        dis = dis + Distances(ChromosomeMatrix(city - 1),ChromosomeMatrix(city));
    end    
        dis = dis + Distances(ChromosomeMatrix(1), ChromosomeMatrix(BoradLenght));      
end