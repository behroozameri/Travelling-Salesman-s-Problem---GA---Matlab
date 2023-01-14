function DomainanceMatrix = MakeDomainanceMatrix(BoradLenght, ACM, ACC)

    DomainanceMatrix = zeros(BoradLenght , BoradLenght);
    list = fix ( 1 + ( ACC - 1 ) .* rand( BoradLenght * 2 , 1 ));
        
	for i = 1 : BoradLenght * 2
        for j = 1 : BoradLenght
        	val = ACM(j,list(i,1));
            DomainanceMatrix( j , val )  = DomainanceMatrix( j , val ) + 1;
        end
	end    
end