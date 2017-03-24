clc
clear all
close all

%% Globals.
UB = 2.0;

% values: 0.484; -0.70176-0.3842i; 0.45+0.1428i; 0.285+0.01i; -0.4+0.6i; 3 - 0.4i
p = 0.484;

%% Canvas size:
M = 1920;
N = 1080;
N_ITER = 500;

get_cplx = @(r,c)((UB * (2 * r-M))/M + (UB * (2 * c-N))/N * 1i);

%% Initialize.
C = zeros(M,N);
for r=1:M
  for c=1:N
    C(r,c) = get_cplx(r,c);
  end
end

%% Render
I = zeros(M,N,3);

for jj=1:N_ITER
  for r=1:M
    for c=1:N
      z = C(r,c);
      [tval z] = is_bounded(z,p,1,jj);
      I(r,c,:) = tval;
      C(r,c) = z;
    end
  end
  if mod(jj,10) == 0
      jj
      image(I);
      pause(0.01);
  end
end

