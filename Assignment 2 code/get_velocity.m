function [root] = get_velocity(a, lm, lt)

% Input Parameters
% a: activation (between 0 and 1)
% lm: normalized length of muscle (contractile element)
% lt: normalized length of tendon (series elastic element)

% Output
% root: normalized lengthening velocity of muscle (contractile element)


% damping coefficient (see damped model in Millard et al.)
%beta = 0.1;

% WRITE CODE HERE TO CALCULATE VELOCITY
[Ft] = force_length_tendon(lt);
[Fpe] = force_length_parallel(lm);
[Fl] = force_length_muscle(lm);

final = @(Ft, Fpe, Fl, vm) (a*Fl*force_velocity_muscle(vm)+Fpe+0.1*vm-Ft);

fun = @(vm) final(Ft, Fpe, Fl, vm);

x0 = 0;
[root] = fzero(fun, x0);

end






