function maxLoad = balls_and_bins(m,n)
    
b = zeros(m,1);
y = zeros(m,n);
x = zeros(1,n);

% init B
for i = 1:m
    b(i) = randi(n,1);
end

% initiate Y
for i = 1:m
    for j = 1:n
        if(b(i) == j)
            y(i,j) = 1;
        end
    end
end

for j = 1:n
    for i = 1:m
        x(j) = x(j) + y(i,j);
    end
end

maxLoad = max(x);


