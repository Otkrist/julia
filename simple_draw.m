clc
clear all
close all

%% Globals.
UB = 2.0;
% values: 0.484; -0.70176-0.3842i; 0.45+0.1428i; 0.285+0.01i; -0.4+0.6i; 3 - 0.4i
p =-0.4+0.6i;

%% Canvas size:
M = 1920;
N = 1080;
N_ITER = 50;
get_cplx = @(r,c)((UB * (2 * r-M))/M + (UB * (2 * c-N))/N * 1i);

%%
I = zeros(M,N);

for r=1:M
  for c=1:N
    z = get_cplx(r,c);
    I(r,c) = is_bounded(z, p, N_ITER, 1);
  end
end

%%

II = zeros(M,N,3);
for r=1:M
  for c=1:N
    II(r,c,:) = (I(r,c))  * [0.5 1 0.83];
  end
end

image(II);