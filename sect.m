%
% Francisco Guiraldelli - 379840 - francisco.guiraldelli@gmail.com
% Rafael Camara Pereira - 380431 - rafael_c_pereira@hotmail.com
%
% Implementacao das iteracoes do metodo da secante, calculo de erro e
% resultado final com numero de iteracoes
%

function[iteration, calc_ep, final_result, time] = sect(fx, x0, x1, epsilon, precision, iter)
    %Variavel booleana auxiliar
    xpto = true;
    %Contador de iteracoes efetuadas
    iteration = 0;
    %Repeticao enquanto epsilon calculado for menor que
    %o pedido e nao ultrapassou o limite de iteracoes
    tic;
    while xpto && iteration < iter
        %Substituicao de x por valores de x0 e x1 na f(x)
        fa = subs(fx, x0);
        fb = subs(fx, x1);
        %Calculo do resultado utilizando a formula da secante         
        %com valor absoluto (positivo) e a precisao pedida
        result = vpa(((x0*fb - x1*fa)/(fb-fa)), precision);
        %Calculo do erro na iteracao atual
        calc_ep = vpa(abs(x0 - result), precision);
        %Verifica a necessidade de mais iteracoes
        if (calc_ep <= epsilon)
            xpto = false;
        end
        %Plota a tangente da iteracao atual no grafico da funcao
        y = line([x0, x1], [fa, fb], 'Color', [1, 0, 0]);
        plot(y);
        %Atualiza x0 e x1
        x0 = x1;
        x1 = result;
        %Somador de iteracoes
        iteration = iteration + 1;
    end
    time = toc;
    %Tratamento do resultado final para exibicao
    final_result = char(result);
end