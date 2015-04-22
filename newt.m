function[iteration, calculated_epsilon, final_result] = newt(fx, x0, epsilon, precision, iter)
    dfx = diff(fx);
    xpto = true;
    iteration = 0;
    while xpto && iteration < iter
        fa = subs(fx, x0);
        dfa = subs(dfx, x0);
        result = vpa((x0 - (fa / dfa)), precision);
        calculated_epsilon = vpa(abs(x0 - result), precision);
        if (calculated_epsilon <= epsilon)
            xpto = false;
        end
        y = line([x0, result], [fa, 0], 'Color', [1, 0, 0]);
        plot(y);
        x0 = result;
        iteration = iteration + 1;
    end
    final_result = char(result);
end