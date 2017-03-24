function [tval] = is_bounded( z,c )
%IS_BOUNDED Summary of this function goes here
%   Detailed explanation goes here

N_ITER = 50000;

%% Inefficient iterant.
for i=1:N_ITER
    z = z*z + c;
    if abs(z) > 4
        tval = 1.0/i;0.5 * (1 - 1.0/i);
        return
    end
end

tval = 1;
end

