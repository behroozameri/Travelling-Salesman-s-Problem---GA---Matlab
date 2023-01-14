function Distances = MakeDistances(BoradLenght , Cities)
    a = meshgrid(1:BoradLenght);
    Distances = reshape(sqrt(sum((Cities(a,:)-Cities(a',:)).^2,2)),BoradLenght,BoradLenght);
    Distances = round(Distances);
end