function AC_B = MakeAC_B(DomainanceMatrix , BoradLenght)
    AC_B = zeros(BoradLenght , 1);
    for i = 1 : BoradLenght
        [~,ind] = max( DomainanceMatrix(i,:) );
        while( AC_B(ind,1) ~= 0 )
            DomainanceMatrix(i,ind) = -1;
            [~,ind] = max( DomainanceMatrix(i,:) );
        end
        AC_B(ind,1) = i;
	end
end