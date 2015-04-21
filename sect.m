function[iteration, calculated_epsilon, final_result] = sec(fx, x0, x1, epsilon, precision, iter)
    iteration = 0;
    xpto = true;
    %Verifica iterações
    while xpto && iteration < iter
        fa = subs(fx, x0);
        fb = subs(fx, x1);
%         m = (fb-fa)/(x1-x0);
%         y = m*(x1-x0)-fa;
        result = (x0*fb - x1*fa)/(fb-fa);
        calculated_epsilon = vpa(abs(x0 - result), precision);
        if (calculated_epsilon <= epsilon)
            xpto = false;
        end
%         ezplot(y);
        x0 = x1;
        x1 = result;
        iteration = iteration + 1;
    end
    final_result = char(vpa(result,precision));
end