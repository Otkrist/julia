function [tval z]  = is_bounded( z, c, N_ITER, ibeg)
%IS_BOUNDED Summary of this function goes here
%   Detailed explanation goes here

%% Inefficient iterant.
modval = 9;
for i=ibeg:ibeg+N_ITER
    z = z*z + c;
    if abs(z) > 2.0
        % 1.0/i;
        tval = (1 - 1.0/i);
        tval = mod(i-1,modval)/modval;
        return
    end
end

tval = 1;
end

