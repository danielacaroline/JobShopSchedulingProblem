function filhos = Cruzamento (pais, pcruz)
n= size(pais, 2);
filhos = zeros (2,n);
k=rand();
if k<pcruz
    pos = floor(1+n*rand());  %single point crossover
    filhos(1,1:pos) = pais(1,1:pos);
    filhos(2,1:pos) = pais(2,1:pos);
    s1 = pos+1;
    s2 = pos+1;
    for i = 1:n
        check1 = 0;
        check2 = 0;
        for j = 1:pos
            if pais(2,i) == filhos(1,j);
                check1 = 1;
            end
            if pais(1,i) == filhos(2,j);
                check2 = 1;
            end
        end
        if check1 == 0
            filhos(1,s1) = pais(2,i);
            s1 = s1 + 1;
        end
        if check2 == 0
            filhos(2,s2) = pais(1,i);
            s2 = s2 + 1;
        end
    end
else
    filhos=pais;
end
end