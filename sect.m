function[iteration, calculated_epsilon, final_result] = sect(fx, x0, x1, epsilon, precision, iter)
    iteration = 0;
    xpto = true;
    while xpto && iteration < iter
        fa = subs(fx, x0);
        fb = subs(fx, x1);
        result = vpa(((x0*fb - x1*fa)/(fb-fa)), precision);
        calculated_epsilon = vpa(abs(x0 - result), precision);
        if (calculated_epsilon <= epsilon)
            xpto = false;
        end
        y = line([x0, x1], [fa, fb], 'Color', [1, 0, 0]);
        plot(y);
        x0 = x1;
        x1 = result;
        iteration = iteration + 1;
    end
    final_result = char(result);
end