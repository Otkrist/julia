
clear all
close all

%% Globals.
UB = 1.5;

% values:0.285+0i;-0.70176-0.3842i; 0.285+0.01i;0.484; 0.45+0.1428i; -0.4+0.6i; 0.3 + 0.4i
p = -0.70176-0.3842i;
%% Canvas size:
% M = 2160;
% N = 3840;
M = 2000;
N = 2000;
N_ITER = 100;

get_cplx = @(r,c)((UB * (2 * r-M))/M + (UB * (2 * c-N))/N * 1i);

%% Initialize.
C = zeros(M,N);
for r=1:M
  for c=1:N
    C(r,c) = get_cplx(r,c);
  end
end

%% Render
figure;
set(gcf, 'Position', get(0,'Screensize')); % Maximize figure.

I = ones(M,N,3);
A = [];
ctr = M*N;

for jj=1:N_ITER
  if ctr > M*N*0.03
    ctr = 0;
    for r=1:M
      for c=1:N
        if I(r,c,2) == 1
          z = C(r,c);
          [tval z] = is_bounded(z,p,1,jj);
          I(r,c,:) = tval* [0.05 1 1];
          C(r,c) = z;
          ctr = ctr + 1;
        end
      end
    end
  else
    if length(A) == 0 || mod(jj, 10) == 0
      l = 0;
      r_c = I(:,:,2) == 1;
      ctr = sum(r_c(:));
      if ctr < 10
          break
      end
      A = uint16(zeros(ctr,2));
      for r=1:M
          for c=1:N
            if (I(r,c,2) == 1)
                l = l + 1;
                A(l,:) = [r c];
            end
          end 
      end
    end
    for l=1:size(A,1)
        r = A(l,1);
        c = A(l,2);
        if I(r,c,2) == 1
          z = C(r,c);
          [tval z] = is_bounded(z,p,1,jj);
          I(r,c,:) = tval* [0.05 1 1];
          C(r,c) = z;
        end
    end
  end

  if mod(jj,1) == 0
      imagesc(I);
      title(sprintf('Iteration = [%d]', jj));
      pause(0.02);
  end
  if mod(jj,100) == 0
      imwrite(I, 'out.jpg');
  end
end

