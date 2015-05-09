function H=entrpy(prob)
    H=0;
    size(prob)
    for i=1:max(size(prob))
        if (prob(i,1)>0)
        H=H+(prob(i,1)*(log2(1/prob(i,1))));
        end

    end
        disp(H);
        disp(H/512);
        disp((8*512)/H);
end