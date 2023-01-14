function child = Mutation(parent,N,d)
    parent = parent';
    index1 = randint(1,1,[1,N]);
    c = parent(index1);
    f = d(c,:);
    [~,INX] = sort(f);
    indexe = INX(2);
    index2 = find(parent==indexe);
    pointer1 = index1;
    pointer2 = index2;
    k = 1;
    C(k) = parent(pointer1);
    k = k+1;
    while(pointer1 ~= pointer2)
        pointer1 = mod((pointer1+1),(N+1));
        if(pointer1 == 0)
            pointer1 = 1;
        end
        C(k) = parent(pointer1);
        k = k+1;
    end
    mat = seqreverse(C);
    [~,col] = size(mat);
    pointer1 = index1;
    child = parent;
    for t = 1 : col
        child(pointer1) = mat(t);
        pointer1 = mod((pointer1+1),(N+1));
        if(pointer1 == 0)
            pointer1 = 1;
        end
    end
    child = child';
end
