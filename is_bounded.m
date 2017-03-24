function [tval z]  = is_bounded( z, c, N_ITER, ibeg)
%IS_BOUNDED Summary of this function goes here
%   Detailed explanation goes here

%% Inefficient iterant.
for i=ibeg:ibeg+N_ITER
    z = z*z + c;
    if abs(z) > 4
        tval = 1.0/i;0.5 * (1 - 1.0/i);
        return
    end
end

tval = 1;
end

