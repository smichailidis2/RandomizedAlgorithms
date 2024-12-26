function Q = rotate(P,e)

vi = e(2);
index = find(P == vi);
P_1 = P(1:index);
P_2 = P(index+1:end);

Q = [P_1; flip(P_2)];
    
