function [C, A, B] = maxCut(G)

V = G{1}; 
E = G{3};
A = [V(1)];
B = [];
% calculate neighbours for A
A_n = calc_nb(V(1),G);
B_n = 0;

for v = 2:length(V)
    N = calc_nb(v,G);
    if A_n <= B_n
        A = [A; v];
        A_n = A_n + N;
    else
        B = [B; v];
        B_n = B_n + N;
    end
end
C = 0;
for i = 1:length(E)
    e = E(i,:);
    if( (ismember(e(1), A) && ismember(e(2), B)) || (ismember(e(1), B) && ismember(e(2), A)) )
        C = C + 1;
    end
end


