function child1 = Crossover_Clockwise(parent1,parent2,N,d)
    parent2 = parent2';
    child1 = zeros(1,N);
    warning('off','comm:obsolete:randint');
    index = randint(1,1,[1,N]);
    c = parent1(index);
    [~,inx] = find(parent2==c);
    child1(1) = c;
    i = 1;
    parent1(index) = 0;
    parent2(inx) = 0;
    pointer1 = index;
    pointer2 = inx;
    pointer1 = mod((pointer1+1),(N+1));
    if(pointer1 == 0)
        pointer1 = 1;
    end
    p = parent1(pointer1);
    pointer2 = mod((pointer2+1),(N+1));
    if(pointer2 == 0)
        pointer2=1;
    end
    q = parent2(pointer2);
    while(i ~= N)
        z = child1(i);
        i = i+1;
        if( d(z,p) <= d(z,q) )
            child1(i) = p;
            in1 = find(parent1==p);
            in2 = find(parent2==p);
            parent1(in1) = 0;
            parent2(in2) = 0;
            %*****
            while(parent1(pointer1) == 0 && i<N)
                pointer1 = mod((pointer1+1),(N+1));
                if( pointer1 == 0 )
                    pointer1 = 1; 
                end
                p = parent1(pointer1);
            end
            if(pointer2 == in2)
              while(parent2(pointer2) == 0 && i<N)
                    pointer2 = mod((pointer2+1),(N+1));
                    if(pointer2 == 0)
                        pointer2 = 1;
                    end
                    q = parent2(pointer2);
              end
            end
        elseif( d(z,p) > d(z,q) )
            child1(i) = q;
            in1 = find(parent1==q);
            in2 = find(parent2==q);
            parent1(in1) = 0;
            parent2(in2) = 0;
            while(parent2(pointer2) == 0 && i<N)
                pointer2 = mod((pointer2+1),(N+1));
                if(pointer2 == 0)
                    pointer2 = 1;
                end
                q = parent2(pointer2);
            end
            if(pointer1 == in1)
                while(parent1(pointer1) == 0 && i<N)
                    pointer1 = mod((pointer1+1),(N+1));
                    if(pointer1 == 0)
                        pointer1 = 1;
                    end
                    p = parent1(pointer1);
                end
            end
        end
    end
    child1 = child1';
end