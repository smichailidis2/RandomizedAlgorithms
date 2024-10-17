% Function that sorts list S using quicksort
% inputs:     S     --> input list 
% output: S_sorted  --> sorted S
function S_sorted = Quicksort(S)

global count;

n = length(S);
if n == 0 || n == 1
    S_sorted = S;
    %sprintf('List size %d; Leaf node reached', n)
    return
end

% random pivot selection
x = S(randi(n));

S1 = [];
S2 = [];

for i = 1:n
    if S(i) < x
        count = count + 1;
        S1 = [S1; S(i)];
    end
    if S(i) > x
        count = count + 1;
        S2 = [S2; S(i)];
    end
end

S1 = Quicksort(S1);
S2 = Quicksort(S2);

S_sorted = [S1 x S2];
%sprintf('List sorted over %d iterations', count_out)

end