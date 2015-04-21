%Limpa as variáveis
clear all;
close all;
%Limpa a Tela
clc;
%Instancia a variável simbólica x
syms x x0 x1;
%Entrada de Dados pelo usuário
warning off backtrace;
method = input('Deseja utilizar o método de Newton ou da Secante?', 's');
fx = input('Digite a função: ');
x0 = input('Digite o valor de x0: ');
if strcmp(method, 'secante')
    x1 = input('Digite o valor de x1: ');
end
epsilon = 10^input('Digite a precisão do erro que deseja: ');
iter = input('Digite a quantidade máxima de iterações: ');
precision = input('Escolha a precisão em casas decimais(3 a 32): ');
xpto = true;
%Tratamento de Erro
while xpto == true
    if (isempty(precision)) || (precision < 3) || (precision > 32)
        clc
        warning('O valor de precisão deve estar entre 3 e 32');
        precision = input('Escolha a precisão em casas decimais(3 a 32): ');
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

%Mostra dados ao usuário
clc;
if iteration < iter

    W = ['A quantidade de iterações efetuadas: ', num2str(iteration)];
    X = ['O valor do erro dado foi: ', num2str(epsilon)];
    Y = ['O valor do erro calculado é: ', num2str(double(calculated_epsilon))];
    Z = ['O valor de zero da raíz é: ', final_result];
    clc
    disp(W);
    disp(X);
    disp(Y);
    disp(Z);
else
    warning('Função ultrapassou o número máximo de iterações');
end

disp('Pressione qualquer tecla para fechar');
pause();
clear all;
close all;
clc;