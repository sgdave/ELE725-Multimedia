function [f,r,c] = floorquant(signal, bits)
%signal=wavread(input);
levels=2^bits;
signal=signal+1;
f=((floor(signal.*levels))/levels)-1;
c=((ceiling(signal.*levels))/levels)-1;
r=((round(signal.*levels))/levels)-1;

end
