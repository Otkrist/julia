clc
clear all
close all

%% Globals.
UB = 2.0;
p  = 0.484;

%% Canvas size:
M = 1920;
N = 1080;
get_cplx = @(r,c)((UB * (2 * r-M))/M + (UB * (2 * c-N))/N * 1i);

%%
I = zeros(M,N);

for r=1:M
  for c=1:N
    z = get_cplx(r,c);
    I(r,c) = is_bounded(z,p);
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