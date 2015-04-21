function[iteration, calculated_epsilon, final_result] = newt(fx, x0, epsilon, precision, iter)
    dfx = diff(fx);
    xpto = true;
    iteration = 0;
    while xpto && iteration < iter
        fa = subs(fx, x0);
        dfa = subs(dfx, x0);
        result = x0 - (fa / dfa);
%         m = (fb-fa)/(x1-x0);
%         y = m*(x1-x0)-fa;
        calculated_epsilon = vpa(abs(x0 - result), precision);
        if (calculated_epsilon <= epsilon)
            xpto = false;
        end
%         ezplot(y);
        x0 = result;
        iteration = iteration + 1;
    end
    final_result = char(vpa(result,precision));
end