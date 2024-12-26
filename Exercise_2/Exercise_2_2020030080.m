%% RANDOMIZED ALGORITHMS
% EXERSISE 2
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
%% 1) Balls & Bins
k = 3;
n = 10^k;
K = 100;
maxLoad = zeros(K,1);
L = ( log(n) )/( log( log(n) ) );
M = 3*( log(n) )/( log( log(n) ) );

for k = 1:K
    maxLoad(k) = balls_and_bins(n,n);
end

figure 
plot(maxLoad,'ks','MarkerFaceColor',[0.5,0.5,0.5],LineWidth=0.8)
hold on
plot(L*ones(K,1),'r')
hold on
plot(M*ones(K,1),'b')
legend('max load','lower bound','upper bound')
xlabel('Experiment $k$')
ylabel('Max Load')
axis([0 K 0.9*L 1.05*M])

figure
histogram(maxLoad)
xlabel('Max Load')
ylabel('Freq')

%% 2) Hamiltonian Cycles
K = 50;
n = 500;
p = (1.0)*40*log(n)/n;
q = 1 - sqrt(1-p);
G = rand_graph(n,p);

[P, FAIL, count1, count2] = Hamiltonian_Cycle(G);
ver = zeros(n,1);
for i = 1:length( P(1:end) ) - 1
    ver(i) = G{2}(P(i),P(i+1));
end

if sum(ver) == n
    fprintf("The algorithm works !\n")
end
