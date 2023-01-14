function flag = CheckSame(a , b, BoradLenght)
    flag = 1;
    for k = 1 : BoradLenght
        if( a(k,1) ~= b(k,1) )
            flag = 0;
            break;
        end
    end
end