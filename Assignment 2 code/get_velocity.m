function [root] = get_velocity(a, lm, lt)
% Function declaration with three input parameters and one output parameter.

% Input Parameters
% a: activation (between 0 and 1)
% lm: normalized length of muscle (contractile element)
% lt: normalized length of tendon (series elastic element)

% damping coefficient (see damped model in Millard et al.)
beta = 0.1;

% WRITE CODE HERE TO CALCULATE VELOCITY
[Ft] = force_length_tendon(lt);
[Fpe] = force_length_parallel(lm);
[Fl] = force_length_muscle(lm);
% Calculation of forces involving tendon, parallel elastic element, and muscle, based on their lengths.

final = @(Ft, Fpe, Fl, beta, vm) (a*Fl*force_velocity_muscle(vm)+Fpe+beta*vm-Ft);
% Definition of the function 'final' which calculates the net force acting on the muscle.

fun = @(vm) final(Ft, Fpe, Fl, beta, vm);
% Definition of an anonymous function 'fun' which takes 'vm' as input and returns the result of 'final' with fixed parameters.

% Output
% root: normalized lengthening velocity of muscle (contractile element)
x0 = 0;
[root] = fzero(fun, x0);
% Use of fzero function to find the root (zero) of 'fun', which represents the normalized lengthening velocity of the muscle.

end





