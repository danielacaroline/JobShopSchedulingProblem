function pop = SelecionaSobrevivente (Pop, novosfilhos,A, nL, nC)
Tpop=size(Pop, 1);
for i=1:2
       aux=1;
       aux2 = Pop(1,:);
       for j=1:Tpop
       
           if fitness(aux2,A, nC, nL)<fitness(Pop(j,:), A, nC, nL)
               aux2= Pop(j,:);
               aux=j;
           end
       end
             
       if fitness(novosfilhos(i,:), A, nC, nL)<fitness(aux2,A, nC, nL)
           Pop(aux,:)=novosfilhos(i,:);
       end
end

pop = Pop;
end
  