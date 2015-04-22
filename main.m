%Limpa as variaveis
clear all;
close all;
%Limpa a Tela
clc;
%Instancia a variavel simbolica x
syms x x0 x1;
%Entrada de Dados pelo usuario
warning off backtrace;
method = input('Digite 1 para utilizar o metodo de Newton ou 2 para utilizar o metodo da Secante: ');
fx = input('Digite a funcao: ');
x0 = input('Digite o valor de x0: ');
if method == 2
    x1 = input('Digite o valor de x1: ');
end
epsilon = 10^input('Digite a precisao do erro que deseja: ');
iter = input('Digite a quantidade maxima de iteracoes: ');
precision = input('Escolha a precisao em casas decimais(3 a 32): ');
xpto = true;
%Tratamento de Erro
while xpto == true
    if (isempty(precision)) || (precision < 3) || (precision > 32)
        clc
        warning('O valor de precisao deve estar entre 3 e 32');
        precision = input('Escolha a precisao em casas decimais(3 a 32): ');
    else
    	xpto = false;
    end
end
precision = abs(precision)-1;
iteration = 0;
figure;
ezplot(fx);
hold on
grid on

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