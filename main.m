%Limpa as vari�veis
clear all;
close all;
%Limpa a Tela
clc;
%Instancia a vari�vel simb�lica x
syms x x0 x1;
%Entrada de Dados pelo usu�rio
warning off backtrace;
method = input('Deseja utilizar o m�todo de Newton ou da Secante?', 's');
fx = input('Digite a fun��o: ');
x0 = input('Digite o valor de x0: ');
if strcmp(method, 'secante')
    x1 = input('Digite o valor de x1: ');
end
epsilon = 10^input('Digite a precis�o do erro que deseja: ');
iter = input('Digite a quantidade m�xima de itera��es: ');
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
precision = abs(precision)-1;
iteration = 0;
figure;
ezplot(fx);
hold on
grid on

if strcmpi(method, 'secante')
    [iteration, calculated_epsilon, final_result] = sect(fx, x0, x1, epsilon, precision, iter);
elseif strcmpi(method, 'newton')
    [iteration, calculated_epsilon, final_result] = newt(fx, x0, epsilon, precision, iter);
end

%Mostra dados ao usu�rio
clc;
if iteration < iter

    W = ['A quantidade de itera��es efetuadas: ', num2str(iteration)];
    X = ['O valor do erro dado foi: ', num2str(epsilon)];
    Y = ['O valor do erro calculado �: ', num2str(double(calculated_epsilon))];
    Z = ['O valor de zero da ra�z �: ', final_result];
    clc
    disp(W);
    disp(X);
    disp(Y);
    disp(Z);
else
    warning('Fun��o ultrapassou o n�mero m�ximo de itera��es');
end

disp('Pressione qualquer tecla para fechar');
pause();
clear all;
close all;
clc;