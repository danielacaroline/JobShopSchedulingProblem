function [fit]=fitness(pop,A, nC, nL)
%auxA=zeros(size(A, 1), size(A, 2));
aux=0;
x=0;
ax1=0;
ax2=0;
Tpop=size(pop, 1);
for i=1:Tpop
    P = pop(i, :); %ordem do pedido
    for j=1:nL
        for k=1:nC
            auxA(j, k)=A(P(j), k);
        end
    end
    for j=1:nC
        if(j==1)
            tb=0;
            for k=1:nL
                t1=auxA(k, j);
                for ta=1:t1
                    maq(ta+tb)=k;
                end
                tb=tb+t1;
            end
        end
        if(j==2)
            tb=auxA(1, 1);
            maq1=maq;
            maq(1:tb)= 0;
            for k=1:nL
                t1=auxA(k, j);
                  for ta=1:t1
                    if((ta+tb)<=size(maq1, 2))
                        if(maq1(ta+tb)==k)
                            while (1)
                                if ((ta+tb+x)> size(maq1, 2))
                                    tb=size(maq1, 2)-ta;
                                    ax1=ta;
                                    aux=0;
                                    break
                                end
                                if  maq1(ta+tb+x)~=k
                                    break;
                                end
                                maq(ta+tb+aux)=0;
                                aux=aux+1;
                                x=x+1;
                            end
                            
                        else maq(ta+tb)=k;
                            x=0;
                        end
                    else maq(ta+tb)=k;
                    end
                    
                end
                if ax1>0
                    for ai1=1:ax1
                        maq(ta+tb+ai1)=k;
                    end                    
                    tb=tb+t1+ax1;
                    ax1=0;
                end
                if aux>0                    
                    for ai2=1:aux
                        maq(ta+tb+ai2)=k;
                    end                    
                end
                tb=tb+t1+aux;
                aux=0;
            end

        end
        if(j==3)
            tb=auxA(1, 1)+auxA(1, 2);
            maq2=maq;
            maq(1:tb)= 0;
            for k=1:nL
                t1=auxA(k, j);
                for ta=1:t1
                    if((ta+tb)<=size(maq2, 2))
                        if(maq2(ta+tb)==k)
                            while (1)
                                if ((ta+tb+x)> size(maq2, 2))
                                    tb=size(maq2, 2)-ta;
                                    ax2=ta;
                                    aux=0;
                                    break;
                                end
                                if  maq2(ta+tb+x)~=k
                                    break;
                                end                                
                                maq(ta+tb+aux)=0;
                                aux=aux+1;
                                x=x+1;
                            end 
                            
                        else maq(ta+tb)=k;
                            x=0;
                        end
                    else maq(ta+tb)=k;
                    end                    
                end
                if ax2>0
                    for ai3=1:ax2
                        maq(ta+tb+ai3)=k;
                    end                    
                    tb=tb+t1+ax2;
                    ax2=0;
                end
                if aux>0
                    for ai4=1:aux
                        maq(ta+tb+ai4)=k;
                    end
                    
                end
                tb=tb+t1+aux;
                aux=0;
            end          
            
        end
        
    end
    makespan =size(maq, 2);
    maq=0;
    fit(i)=makespan;

end

end