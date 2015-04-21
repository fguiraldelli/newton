%Limpa as vari�veis
clear all;
close all;
%Limpa a Tela
clc;
%Instancia a vari�vel simb�lica x
syms x x0 x1;
%Entrada de Dados pelo usu�rio
warning off backtrace;
fx = input('Digite a fun��o: ');
x0 = input('Digite o valor de x0: ');
x1 = input('Digite o valor de x1: ');
epsilon = 10^input('Digite a precis�o do erro que deseja: ');
precision = input('Escolha a precis�o em casas decimais(3 a 32): ');
xpto = true;
%Tratamento de Erro
while xpto == true
    if (isempty(precision)) || (precision < 3) || (precision > 32)
        clc
        warning('O valor de precis�o deve estar entre 3 e 32');
        precision = input('Escolha a precis�o em casas decimais(3 a 32): ');
    else
    	xpto = false;
    end
end
xpto = true;
precision = abs(precision)-1;
iteration = 0;
figure;
ezplot(fx);
hold on
grid on
%Verifica itera��es
while xpto && iteration < 100
    fa = subs(fx, x, x0);
    fb = subs(fx, x, x1);
    m = (fb-fa)/(x1-x0);
    y = m*(x1-x0)-fa;
    result = (x0*fb - x1*fa)/(fb-fa);
    calculated_epsilon = vpa(abs(x0 - result), precision);
    if (calculated_epsilon <= epsilon)
        xpto = false;
    end
    ezplot(y);
    x0 = x1;
    x1 = result;
    iteration = iteration + 1;
end
final_result = char(vpa(result,precision));
calc_ep = double(calculated_epsilon);
%Mostra dados ao usu�rio
if iteration < 100

    W = ['A quantidade de itera��es efetuadas: ', num2str(iteration)];
    X = ['O valor do erro dado foi: ', num2str(epsilon)];
    Y = ['O valor do erro calculado �: ', num2str(calc_ep)];
    Z = ['O valor de zero da ra�z �: ', final_result];
    clc
    disp(W);
    disp(X);
    disp(Y);
    disp(Z);
else
    warning('Fun��o ultrapassou o n�mero m�ximo de itera��es');
end