function [P, failed, count1, count2] = Hamiltonian_Cycle(G)
    
V = G{1}; A = G{2};
n = G{4}; p = G{5};
q = 1 - sqrt(1-p);
path_exists = 1;
% used and unused edges lists
ue = cell([n,1]); % used edges
une = cell([n,1]);% unused edges
for v = 1:length(V)
    ue{v} = [];
    for u = v:length(V)
        if(A(u,v) == 1)
            w = rand;
            if(w <= q)
                une{v} = [une{v}; u];
            else
                une{u} = [une{u}; v];
                une{v} = [une{v}; u];
            end                
        end
    end
    une{v} = une{v}(randperm(length(une{v})));
end
%% Step 1
P = [];
Hd = V(randi(n),1);

%% Step 2
count1 = 0;


while(1)
    count1 = count1 + 1;
    p_i = 1/n;
    p_ii = length(ue{Hd})/n;
    w = rand;
    
    % Perform Substep (i)
    if(w <= p_i)
        P = flip(P);
        Hd = P(end);
    
    % Perform Substep (ii)
    elseif w <= p_i + p_ii
        head_edges = ue{Hd};
        v_i = head_edges(randi(length(head_edges),1));
        e = [Hd v_i];

        if(v_i ~= P(end-1))
            P = rotate(P,e);
            Hd = P(end);
        end

    % Perform Substep (iii)
    else
        u = une{Hd}(1);
        FIRST = [Hd u];
        une{Hd}(une{Hd} == u) = [];
        ue{Hd} = [ue{Hd}; u];

        if isempty(une{Hd}) == true
            fprintf("Hamiltonian Path NOT found\n");
            P = -1;
            failed = 1;
            break
        end

        if(~ismember(u,P))
            P = [P; u];
            Hd = u;
        else
            P = rotate(P,FIRST);
            Hd = P(end);
        end

    end
    
    %% Step 3
    if count1 > 2*n*log(n)
        fprintf("Path Search max iterations reached - %d.\n", count1)
        P = -1;
        failed = 1;
        break
    end
    if check(P,G,'path') == 1
        fprintf("Path found in %d iterations\n", count1);
        failed = 0;
        break
    end
    
end

%% Cycle Search

%% Step 2
count2 = 0;
while(path_exists)
    count2 = count2 + 1;
    p_i = 1/n;
    p_ii = length(ue{Hd})/n;
    w = rand;       %uar
    
    %% Perform Substep (i)
    if(w <= p_i)
        P = flip(P);
        Hd = P(end);
    
    %% Perform Substep (ii)
    elseif w <= p_i + p_ii
        head_edges = ue{Hd};
        v_i = head_edges(randi(length(head_edges),1));
        e = [Hd v_i];
            
        if(v_i ~= P(end-1))
            P = rotate(P,e);
            Hd = P(end);
        end

    %% Perform Substep (iii)
    else
        u = une{Hd}(1);
        FIRST = [Hd u];
        une{Hd}(une{Hd} == u) = [];
        ue{Hd} = [une{Hd}; u];

        if isempty(une{Hd}) == true
            fprintf("Hamiltonian Cycle NOT found\n");
            P = -1;
            failed = 1;
            break
        end

        if ~ismember(u,P)
            P = [P; u];
            Hd = u;
        elseif(check([P; u],G,'cycle') == 1 && ismember(u,P))
            fprintf("Cycle found in %d iterations\n", count2);
            P = [P; u];
            failed = 0;
            break
        else
            P = rotate(P,FIRST);
            Hd = P(end);
        end

    end
    
    %% Step 3
    
    if count2 > n*log(n)
        fprintf("Cycle Search Maximum iterations reached - %d.\n", count2)
        P = -1;
        failed = 1;
        break
    end
end