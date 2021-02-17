function pais= SelecionaPais(paisinit,ind_aleatorio, r, A, nL, nC)
%r = numero de individuos
%-----avalia cada cadidato e escolhe entre os 2 melhores-------
%--paisinit é um vetor que sempre inicializa o valor de pais com valor de
%1:nL
for i=1:r
    if fitness (paisinit(1,:), A, nC, nL)>fitness(ind_aleatorio(i,:), A, nC, nL)
         paisinit(1,:)=ind_aleatorio(i,:) ;
         ind_aleatorio(i, :)= ind_aleatorio(r, :);
         ind_aleatorio(r, :)= paisinit(1, :);
    end
end

for i=1:r-1
    if fitness(paisinit(2,:), A, nC, nL)>fitness(ind_aleatorio(i,:), A, nC,nL)
         paisinit(2,:)=ind_aleatorio(i,:);
         ind_aleatorio(i, :)= ind_aleatorio(r-1, :);
         ind_aleatorio(r-1, :)= paisinit(1, :);
    end
end
pais = paisinit;
end