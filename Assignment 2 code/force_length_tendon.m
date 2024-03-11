function [normalize_tendon_tension] = force_length_tendon(lt)
%%%% TASK 1

% Input Parameters
% lt: normalized length of tendon (series elastic element)

% if lt < 1, function = 0, else 10(lt - 1)+240(lt-1)^2 if lm >= 1

% Output
% normalized tension produced by tendon

% WRITE YOUR CODE HERE
% performs the equation for the set boundaries for tension function:

    normalize_tendon_tension = (lt < 1) .* 0 + (lt >= 1) .* (10*(lt - 1) + 240*(lt - 1).^2);

end