% function that finds the median of list S
% input :      S    --> input list
% outputs : median  --> median of S
%           flag    --> boolean success flag (0 => FAILURE, 1 => SUCCESS)
%       comparisons --> number of comparisons made
function [median,flag,comp] = Randomized_Median(S)
median = 0;
flag = 0;
comp = 0;

n = length(S);
le = ceil(n^(3/4));
R = zeros(le,1);
% sample with replacement
for i = 1:le
    R(i) = S(randi(n));
end
% sort
comp = comp + le*log(le);
R = sort(R);
% get down and up elements
d = R(floor( 0.5*n^(3/4) - sqrt(n) ) );
u = R( ceil( 0.5*n^(3/4) + sqrt(n) ) );

C = [];
ld = 0;
lu = 0;
for j = 1:n
    comp = comp + 3;
    if S(j) > d && S(j) < u
        C = [C ; S(j)];
    end
    if S(j) < d
        ld = ld + 1;
    end
    if S(j) > u
        lu = lu + 1;
    end
end

% check cardinality of sets A and B
comp = comp + 1;
if ld > n/2 || lu > n/2
    fprintf('\nAlgorithm FAILED invalid cardinality of either A or B\n');
    return;
end

% check cardinality of set C
comp = comp + 1;
if length(C) <= 4*n^(3/4)
    comp = comp + length(C)*log(length(C));
    sort(C);
else
    fprintf('\nAlgorithm FAILED: invalid cardinality of set C\n');
    return;
end

%fprintf('\nAlgorithm SUCCESS\n');
median = C(floor( n/2 ) - ld + 1);
flag = 1;

end