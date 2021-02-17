function [makespan, sequence, avg_fit, best_fit] = JSSP(arquivo)
A=load(arquivo);%arquivo de entrada
nC=size(A, 2);%número de maquinas
nL=size(A, 1);%número de pedidos
%tamanho da população
Tpop =20;

%probabilidade de cruzamento
pcruz=0.9;

%probabilidade de mutação
pmut=0.9;

%número de gerações
Nger=200;

best_fit=zeros(1, Nger);
avg_fit=zeros(1, Nger);

%inicializa população
pop=zeros(Tpop, nL);
for i=1:Tpop
    pop(i, :)=randperm(nL);
end

%---Para primeria população gerada--------
%escolha aleatoriamente dez indivíduos na população;
r=5;
k = ceil(rand(1, r)*Tpop);
ind_aleatorio = pop (k, :);
paisinit = [1:nL; 1:nL];

int=1;
while(1)
    %----- Fitness------------------------
    fit= fitness(pop,A, nC, nL);
    
    %------makespan médio (fitness médio)-----------------
    avg_fit(int) = mean(fit);
    
    %---------melhor makespan (melhor fitness)---------------
    best_fit(int) = min(fit);
    
    %-----indice do melhor fitness atual-----------
    indice = find(fit==min(fit));
    
    %----sequencia do melhor makespan----------
    sequence = pop(indice(1), :);    
    
    %-------Seleção dos Pais----------------
    pais = SelecionaPais(paisinit,ind_aleatorio, r, A, nL, nC);
    
    %---------Crossover----------------------
    filhos = Cruzamento(pais, pcruz);
    
    %--------Mutação-----------------------
    novosfilhos = Mutacao(filhos, pmut);
    
    %----------Seleção dos sobreviventes----------
    pop = SelecionaSobrevivente (pop, novosfilhos,A, nL, nC);
    
    %-----------Seleciona individuos aleatorios que podem ser pais-----
    k = ceil(rand(1, r)*Tpop);
    ind_aleatorio = pop (k, :);
    
    
    if ((int > Nger))
        break;
    end
    int=int+1;
end
%fitness da melhor solução encontrada
makespan=min(best_fit);

figure(1)
hold on
plot(avg_fit,'r*-')
plot(best_fit,'b*-')
xlabel('geração')
ylabel('fitness')
title('\fontsize{16}Desempenho')
legend('media', 'melhor')
xlim([0 Nger])

end