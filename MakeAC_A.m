function AC_A = MakeAC_A(DomainanceMatrix , BoradLenght)
    AC_A = zeros(BoradLenght , 1);
    for i = 1 : BoradLenght
    	[~,ind] = max( DomainanceMatrix(i,:) );
        [a, ~]=size(find(AC_A(:,1) == ind));
        while( a ~= 0 )
            DomainanceMatrix(i,ind) = -1;
            [~,ind] = max( DomainanceMatrix(i,:) );
            [a, ~]=size(find(AC_A(:,1) == ind));
        end
        AC_A(i,1) = ind;
    end
end