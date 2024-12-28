%% RANDOMIZED ALGORITHMS
% EXERSISE 3
%
% MICHAILIDIS STERGIOS 2020030080
%
% winter 2024
%%
close all
clear
clc
% for better text, change text interpreter to latex
set(groot,'defaulttextinterpreter','latex'); 
set(groot, 'defaultAxesTickLabelInterpreter','latex');  
set(groot, 'defaultLegendInterpreter','latex');

%% (1) Max-Cut Algorithms
n = 1000;
p = 0.1;
G = rand_graph(n,p);
[C_rand, count] = largeCut(G);
[C_det, A, B] = maxCut(G);
fprintf("\n===========================================================")
fprintf("\nFor random graph G with m/2 = %d \n", length(G{3})/2)
fprintf("\tLarge cut of Randomized algorithm:    C(A,B) = %d \n", C_rand)
fprintf("\tLarge cut of Deterministic algorithm: C(A,B) = %d", C_det)
fprintf("\n===========================================================\n\n")

%% (2) Empty Bins
n = 100;
m = n;
k = 3;
K = 10^k;

S = zeros(K,1);
for kk = 1:K
    [X, S(kk)] = em_balls_and_bins(m,n);
end

% theoretical and experimantal means
tmean = n*(1 - 1/n)^m;
emean = mean(S);

figure
plot(S)
hold on
plot(tmean*ones(K,1),LineWidth=1.6)
plot(emean*ones(K,1),LineWidth=1.2)
grid on
title('Number of empty bins over the experiments')
xlabel('Experiment $k$')
ylabel('Empty Bins')
legend('Empty Bins','theoretical mean','experimental mean')
hold off

n_min = 0;
n_max = n - 1;
figure 
histogram(S,'BinLimits',[n_min,n_max], 'FaceColor', [0.2 0.5 0])
title('Histogram of empty bins')
xlabel('Empty Bins')
ylabel('Frequency')
