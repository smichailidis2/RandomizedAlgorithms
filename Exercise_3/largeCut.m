function [C, count] = largeCut(G)

E = G{3};
m = length(E);
count = 0;

while(1)
    
    count = count + 1;
    [A,B] = partition(G);

    C = 0;
    for i = 1:length(E)
        e = E(i,:);
        if((ismember(e(1),A) && ismember(e(2),B)) || (ismember(e(1),B) && ismember(e(2),A)))
            C = C + 1;
        end
    end
    if(C > m/2 + 1)
        break;
    end
end