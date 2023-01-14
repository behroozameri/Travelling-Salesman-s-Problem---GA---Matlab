function child2 = Crossover_CounterClockwise(parent1,parent2,N,d)
    parent2 = parent2';
    child2 = zeros(1,N);
    index = randint(1,1,[1,N]);
    c = parent1(index);
    [~,inx] = find(parent2==c);
    child2(1) = c;
    i = 1;
    parent1(index) = 0;
    parent2(inx) = 0;
    PA = parent1;
    PB = parent2;
    pointer1 = index;
    pointer2 = inx;
    pointer1 = mod((pointer1-1),N);
    if(pointer1 == 0)
        pointer1 = N;
    end
    p = PA(pointer1);
    pointer2 = mod((pointer2-1),(N));
    if(pointer2 == 0)
        pointer2 = N;
    end
    q = PB(pointer2);
    while(i ~= N)
        z = child2(i);
        i = i+1;
        if( d(z,p) <= d(z,q) )
            child2(i) = p;
            in1 = find(PA==p);
            in2 = find(PB==p);
            PA(in1) = 0;
            PB(in2) = 0;
            while(PA(pointer1) == 0 && i<N)
                pointer1 = mod((pointer1-1),N);
                if(pointer1 == 0)
                    pointer1 = N;
                end
                p = PA(pointer1);
            end
            if(pointer2 == in2)
                while(PB(pointer2) == 0 && i<N)
                    pointer2 = mod((pointer2-1),N);
                    if(pointer2 == 0)
                        pointer2 = N;
                    end
                    q = PB(pointer2);
                end
            end
        else
            child2(i) = q;
            in1 = find(PA==q);
            in2 = find(PB==q);
            PA(in1) = 0;
            PB(in2) = 0;
            while(PB(pointer2) == 0 && i<N)
                pointer2 = mod((pointer2-1),N);
                if(pointer2 == 0)
                    pointer2 = N;
                end
                q = PB(pointer2);
            end
            if(pointer1 == in1)
                while(PA(pointer1) == 0 && i<N)
                    pointer1 = mod((pointer1-1),N);
                    if(pointer1 == 0)
                        pointer1 = N;
                    end
                    q = PA(pointer1);
                end
            end
        end
    end
    child2 = child2';
end