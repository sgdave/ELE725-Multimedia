function DownSampl(input)
%recObj = audiorecorder
%disp('Start Speaking NOW!')
%recordblocking(recObj,3);
%disp('Stop Speaking')
%inFile=getaudiodata(audio)

inFile=audioread(input);
ds2=downsample(inFile,2);
ds3=downsample(inFile,3);
ds4=downsample(inFile,4);
ds8=downsample(inFile,8);

dec2 = decimate(inFile,2,1);
dec3 = decimate(inFile,3,1);
dec4 = decimate(inFile,4,1);
dec8 = decimate(inFile,8,1);

figure;
subplot(2,4,1)
plot(real(fft(ds2)))
title('Downsample N=2')
subplot(2,4,2)
plot(real(fft(ds3)))
title('Downsample N=3')
subplot(2,4,3)
plot(real(fft(ds4)))
title('Downsample N=4')
subplot(2,4,4)
plot(real(fft(ds8)))
title('Downsample N=8')

subplot(2,4,5)
plot(real(fft(ds2)))
title('Decimate N=2')
subplot(2,4,6)
plot(real(fft(ds3)))
title('Decimate N=3')
subplot(2,4,7)
plot(real(fft(ds4)))
title('Decimate N=4')
subplot(2,4,8)
plot(real(fft(ds8)))
title('Decimate N=8')


recon2 = interp(dec2,2,4,0.5);
recon3 = interp(dec3,3,4,0.5);
recon4 = interp(dec4,4,4,0.5);
recon8 = interp(dec8,8,4,0.5);

recon2ds = interp(ds2,2,4,0.5);
recon3ds = interp(ds3,3,4,0.5);
recon4ds = interp(ds4,4,4,0.5);
recon8ds = interp(ds8,8,4,0.5);

figure % create new figure
subplot(3,3,1) % first subplot
plot(real(fft(inFile)))
title('Orginal recording')
subplot(3,3,2)
plot(real(fft(recon2)))
title('N=2 Filter')
subplot(3,3,3)
plot(real(fft(recon3)))
title('N=3 Filter')
subplot(3,3,4)
plot(real(fft(recon4)))
title('N=4 Filter')
subplot(3,3,5)
plot(real(fft(recon8)))
title('N=8 Filter')

subplot(3,3,6)
plot(real(fft(recon2ds)))
title('N=2 No Filter')
subplot(3,3,7)
plot(real(fft(recon3ds)))
title('N=3 No Filter')
subplot(3,3,8)
plot(real(fft(recon4ds)))
title('N=4 No Filter')
subplot(3,3,9)
plot(real(fft(recon8ds)))
title('N=8 No Filter')
%{
disp('Original')
sound(inFile)
pause(3)
disp('N=2 No Filter')
sound(recon2)
pause(3)
disp('N=2 Filter')
sound(recon2ds)
pause(3)
disp('N=3 No Filter')
sound(recon3)
pause(3)
disp('N=3 Filter')
sound(recon4ds)
pause(3)
disp('N=4 No Filter')
sound(recon4)
pause(3)
disp('N=4 Filter')
sound(recon4ds)
disp('N=8 No Filter')
sound(recon8)
pause(3)
disp('N=8 Filter')
sound(recon8ds)
%}
end
    