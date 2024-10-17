%% RANDOMIZED ALGORITHMS
% EXERSISE 1
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
%% 1) Coupon Collector
n_1 = 1000;
K_1 = 500;
iterations = zeros(1,K_1);

for i = 1:K_1
    iterations(i) = Coupon_Collector(n_1);
end

th_mean = n_1*log(n_1)+n_1;
exp_mean = mean(iterations);

figure;
plot(iterations)
grid on;
hold on;
plot(th_mean*ones(K_1,1))
plot(exp_mean*ones(K_1,1))
legend('Selections','Theoretical mean','Experimental mean');
xlabel('experiment number $k$')
ylabel('Iterations')
title('Coupon collector runtime')

figure;
histogram(iterations,'NumBins',25)
title('Number of selections in Coupon collector')
ylabel('frequency')
xlabel('iterations $x$')

%% 2) Quick Sort
K_2 = 500;
n_2 = 1000;
S_k = zeros(n_2,1);
global count;

range = 10^6;

comparisons = zeros(K_2,1);

for k = 1:K_2
    count = 0;
    S_k = randperm(range,n_2);
    Quicksort(S_k);
    comparisons(k) = count;
end


th_runtime_est = 2*(n_2 + 1)*Harmonic(n_2) - 4*n_2;
exp_runtime_est = mean(comparisons);

figure;
plot(comparisons)
title('Quicksort runtime')
grid on;
xlabel("experiment $k$")
ylabel("number of comparisons")
hold on;
plot(exp_runtime_est*ones(K_2,1))
plot(th_runtime_est*ones(K_2,1),'LineWidth',1)
legend('runtime per experiment','Experimental mean runtime','Theoretical mean runtime','Location','best')

figure;
histogram(comparisons,'NumBins',25)
title('Number of comparisons in Quicksort')
ylabel('frequency')
xlabel('Comparisons')

%% 3) Randomized Median
range3 = 10^6;
flag = 0;
K_3 = 50;
total_comp = zeros(K_3,1);

for k = 1:K_3
flag = 0;
S_3 = randperm(range3,k*200+1);
    while ~flag
        [median,flag,comp] = Randomized_Median(S_3);
        total_comp(k) = total_comp(k) + comp;
    end
end

figure;
plot(200:200:10000,total_comp)
title('Randomized Median runtime')
grid on;
xlabel("list length $n$")
ylabel("number of comparisons")
hold on;

