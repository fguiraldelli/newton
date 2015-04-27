%
% Francisco Guiraldelli    -    379840    -    francisco.guiraldelli@gmail.com
% Rafael Camara Pereira    -    380431    -    rafael_c_pereira@hotmail.com
%
% Implementacao das iteracoes do metodo de Newton, calculo de erro e
% resultado final com numero de iteracoes
%

function[iteration, calculated_epsilon, final_result, time] = newt(fx, x0, epsilon, precision, iter)
    %Derivada da funcao
    dfx = diff(fx);
    %Variavel booleana auxiliar
    xpto = true;
    %Contador de iteracoes efetuadas
    iteration = 0;
    %Repeticao enquanto epsilon calculado for menor que o pedido e nao
    %ultrapassou o limite de iteracoes
    tic;
    while xpto && iteration < iter
        %Substituicao de x por valores de x0 na f(x) e f'(x)
        fa = subs(fx, x0);
        dfa = subs(dfx, x0);
        %Calculo do resultado utilizando a formula de Newton com valor
        %absoluto (positivo) e a precisao pedida
        result = vpa((x0 - (fa / dfa)), precision);
        %Calculo do erro na iteracao atual
        calculated_epsilon = vpa(abs(x0 - result), precision);
        %Verifica a necessidade de mais iteracoes
        if (calculated_epsilon <= epsilon)
            xpto = false;
        end
        %Plota a tangente da iteracao atual no grafico da funcao
        y = line([x0, result], [fa, 0], 'Color', [1, 0, 0]);
        plot(y);
        %Atualiza x0
        x0 = result;
        %Somador de iteracoes
        iteration = iteration + 1;
    end
    time = toc;
    %Tratamento do resultado final para exibicao
    final_result = char(result);
end