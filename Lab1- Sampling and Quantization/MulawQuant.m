function MulawQuant(input,mu,y)
%inFile=audioread(input);
if y == 1
x=compand(input,mu,max(input));
UniformQuant(x, 1, mu, input);
elseif y == 0
    UniformQuant(input, 0, mu, input);
end
end