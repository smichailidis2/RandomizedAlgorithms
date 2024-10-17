% | Function that simulates the coupon collector problem |
% | Input: Number of coupons --> n                       |
% | Output: number of iterations (selections) --> iter   |
function iter = Coupon_Collector(n)

coupons = zeros(1,n);
iter = 0;

while(true)
    if sum(coupons) == n
        break;
    end
    coupons(randi(n)) = 1;
    iter = iter + 1;
end

end