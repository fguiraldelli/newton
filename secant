%Limpa as variáveis
clear all;
%Limpa a Tela
clc;
%Instancia a variável simbólica x
syms x x0;
%Entrada de Dados pelo usuário
warning off backtrace;
fx = input('Digite a função: ');
x0 = input('Digite o valor de x0 (chute incial): ');
epsilon = input('Digite a precisão do erro que deseja: ');
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
%Cálculo de Derivada 1ª e 2ª
dfx = diff(fx);
ddfx = diff(fx, 2);
xpto = true;
precision = abs(precision)-1;
iteration = 0;
%Verifica iterações
while xpto && iteration < 100
    fa = subs(fx, x, x0);
    dfa = subs(dfx, x, x0);
    result = x0 - (fa / dfa);
    calculated_epsilon = vpa(abs(x0 - result), precision);
    if (calculated_epsilon <= epsilon)
        xpto = false;
    end
    x0 = result;
    iteration = iteration + 1;
end
final_result = char(vpa(result,precision));
%Mostra dados ao usuário
if iteration < 100

    W = ['A quantidade de iterações efetuadas: ', num2str(iteration)];
    X = ['O valor do erro dado foi: ', num2str(epsilon)];
    Y = ['O valor do erro calculado é: ', char(calculated_epsilon)];
    Z = ['O valor de zero da raíz é: ', final_result];
    clc
    disp(W);
    disp(X);
    disp(Y);
    disp(Z);
else
    warning('Função ultrapassou o número máximo de iterações');
end