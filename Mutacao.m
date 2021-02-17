function novosfilhos = Mutacao(filhos, pmut)
%primeiro offspring
n=size(filhos,2);
k = rand();
if k < pmut
      a=floor(1+n*rand());
      b=floor(1+n*rand());
      aux =filhos(1,a);
      filhos(1,a)=filhos(1,b);
      filhos(1,b)= aux;
end
%segundo offspring
if k < pmut
      a=floor(1+n*rand());
      b=floor(1+n*rand());
      aux=filhos(2,a);
      filhos(2,a)=filhos(2,b);
      filhos(2,b)=aux;
end    
      novosfilhos = filhos;
end