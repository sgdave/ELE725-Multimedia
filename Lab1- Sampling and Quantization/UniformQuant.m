function UniformQuant(inFile, x, mu, inp)
%input=audioread('music_segment.wav');

[uq8f, uq8r, uq8c] = quant(inFile, 8);
[uq6f, uq6r, uq6c] = quant(inFile, 6);
[uq4f, uq4r, uq4c] = quant(inFile, 4);
inFile=inp;
if x==1
    uq8f = compand(uq8f,mu,max(uq8f),'mu/expander');
    uq8r = compand(uq8r,mu,max(uq8r),'mu/expander');
    uq8c = compand(uq8c,mu,max(uq8c),'mu/expander');
    uq6f = compand(uq6f,mu,max(uq6f),'mu/expander');
    uq6r = compand(uq6r,mu,max(uq6r),'mu/expander');
    uq6c = compand(uq6c,mu,max(uq6c),'mu/expander');
    uq4f = compand(uq4f,mu,max(uq4f),'mu/expander');
    uq4r = compand(uq4r,mu,max(uq4r),'mu/expander');
    uq4c = compand(uq4c,mu,max(uq4c),'mu/expander');
end

figure;
plot(inFile)
title('Original');
figure;
subplot(3,3,1)
plot(uq8r)
err=meanserr(uq8r, inFile);
title(['Quant 8 bit Round with MSE= ', num2str(err)]);

subplot(3,3,2)
plot(uq8c)
err=meanserr(uq8c, inFile);
title(['Quant 8 bit Ceiling with MSE= ', num2str(err)]);

subplot(3,3,3)
plot(uq8f)
err=meanserr(uq8f, inFile);
title(['Quant 8 bit Floor with MSE= ', num2str(err)]);

subplot(3,3,4)
plot(uq6r)
err=meanserr(uq6r, inFile);
title(['Quant 6 bit Round with MSE= ', num2str(err)]);

subplot(3,3,5)
plot(uq6c)
err=meanserr(uq6c, inFile);
title(['Quant 6 bit Ceiling with MSE= ', num2str(err)]);

subplot(3,3,6)
plot(uq6f)
err=meanserr(uq6f, inFile);
title(['Quant 6 bit Floor with MSE= ', num2str(err)]);

subplot(3,3,7)
plot(uq4r)
err=meanserr(uq4r, inFile);
title(['Quant 4 bit Round with MSE= ', num2str(err)]);

subplot(3,3,8)
plot(uq4c)
err=meanserr(uq4c, inFile);
title(['Quant 4 bit Ceiling with MSE= ', num2str(err)]);

subplot(3,3,9)
plot(uq4f)
err=meanserr(uq4f, inFile);
title(['Quant 4 bit Floor with MSE= ', num2str(err)]);

end

function m = meanserr(sig2, sig1)
m=mean(mean((sig2-sig1).^2));%/(max(size(sig1)));
%c=max(size(audioread('music_segment.wav')))

end


function [f,r,c] = quant(signal, bits)
%signal=wavread(input);
levels=2^bits;
signal=signal+1;
f=(((floor(signal.*levels))/levels)-1);
c=(((ceil(signal.*levels))/levels)-1);
r=(((round(signal.*levels))/levels)-1);

end


