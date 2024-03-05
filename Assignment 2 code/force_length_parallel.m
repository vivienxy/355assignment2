function [normalize_PE_force] = force_length_parallel(lm)
%%%% TASK 1

% Input Parameters
% lm: normalized length of muscle (contractile element)

% if lm < 1, function = 0, else 3(lm - 1)^2/(0.6+lm-1) if lm >= 1

% Output
% normalized force produced by parallel elastic element

% WRITE YOUR CODE HERE

 % alternative: if-else statement
 %   if lt < 1
 %       normalize_PE_force = 0;
 %   else 
 %       normalize_PE_force = 3*(lm-1)^2/(0.6+lm-1);
 %   end

% performs the equation for the set boundaries for PE function:

    normalize_PE_force = (lm < 1) .* 0 + (lm >= 1) .* (3*(lm-1).^2./(0.6+lm-1));

end