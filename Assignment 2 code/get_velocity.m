function [root] = get_velocity(a, lm, lt)

% Input Parameters
% a: activation (between 0 and 1)
% lm: normalized length of muscle (contractile element)
% lt: normalized length of tendon (series elastic element)

% Output
% root: normalized lengthening velocity of muscle (contractile element)


% damping coefficient (see damped model in Millard et al.)
beta = 0.1;

% WRITE CODE HERE TO CALCULATE VELOCITY
alpha = 0;
Ft = force_length_tendon(lt);
Fpe = force_length_parallel(lm);
Fl = get_muscle_force_length_regression();
Fv = get_muscle_force_velocity_regression();

vm_func = (Ft - Fpe - (a * Fl * Fv)) / beta * cos(alpha);
x0 = 0;

[root] = fzero(vm_func, x0, options);

end






