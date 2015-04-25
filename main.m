%
% Francisco Guiraldelli    -    379840    -    francisco.guiraldelli@gmail.com
% Rafael Camara Pereira    -    380431    -    rafael_c_pereira@hotmail.com
%
% Implementacao da rotina de execucao principal com entrada de dados pelo
% usuario, tratamento de erros, chamada das rotinas principais e exibicao
% de resultados
%

%Limpa as variaveis
clear all;
close all;
%Limpa a Tela
clc;
%Elimina mostra na tela de detalhes de tratamento de erro
warning off backtrace;

%Instancia as variaveis simbolicas
syms x x0 x1;
%Variavel booleana auxiliar
xpto = false;

%Entrada de Dados pelo usuario
%Tratamento de Erro
while xpto == false
    method = input('Digite 1 para utilizar o metodo de Newton ou 2 para utilizar o metodo da Secante: ');
    if (method == 1) || (method == 2)
        xpto = true;
    else
        clc;
        warning('Valor nao corresponde a nenhum metodo');
    end
end
fx = input('Digite a funcao: ');
x0 = input('Digite o valor de x0: ');
%Dado exclusivo do metodo da secante
if method == 2
    x1 = input('Digite o valor de x1: ');
end
epsilon = input('Digite a precisao do erro que deseja: ');
iter = input('Digite a quantidade maxima de iteracoes: ');
%Tratamento de Erro
while xpto == true
    precision = input('Escolha a precisao em casas decimais(3 a 32): ');
    if (precision >= 3) && (precision <= 32) && (precision >= abs(epsilon))
        xpto = false;
    else
        clc;
        if (precision < abs(epsilon))
            warning('O valor de precisao deve ser maior ou igual a precisao do erro');
        end
        if (precision < 3) || (precision > 32) || (isempty(precision))
            warning('O valor de precisao deve estar entre 3 e 32');
        end
    end
end
%Tratamento especial de erro na mostra de precisao em unix
precision = abs(precision)-1;
epsilon = 10^epsilon;
%Plotagem do grafico da funcao
figure;
ezplot(fx);
hold on
grid on

%Chamada para o metodo escolhido
if method == 2
    [iteration, calculated_epsilon, final_result] = sect(fx, x0, x1, epsilon, precision, iter);
elseif method == 1
    [iteration, calculated_epsilon, final_result] = newt(fx, x0, epsilon, precision, iter);
end

%Mostra dados ao usuário
clc;
if iteration < iter
    W = ['A quantidade de iteracoes efetuadas: ', num2str(iteration)];
    X = ['O valor do erro dado foi: ', num2str(epsilon)];
    Y = ['O valor do erro calculado e: ', num2str(double(calculated_epsilon))];
    Z = ['O valor de zero da raiz e: ', final_result];
    clc
    disp(W);
    disp(X);
    disp(Y);
    disp(Z);
else
    warning('Funcao ultrapassou o numero maximo de iteracoes');
end

disp('Pressione qualquer tecla para fechar');
pause();
clear all;
close all;
clc;