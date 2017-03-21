% Goertzel Check
% Comparing the output provided by the Goertzel algorithm with Matlab's 
% in-build Matlab FFT function. The test input signal is a 770Hz sine
% waveform.

clc;
clear;

Fs = 8000;
Ftarget = 770;
N = 205; 

maxFreq = 2000;
goertzelMag = zeros(maxFreq);

for i = 1:maxFreq
    signal = sin_generator(i,Fs,N);
    goertzelMag(i) = goertzel(signal, Ftarget, Fs, N);
end

sinWave = sin_generator(Ftarget, Fs, N);
fftAns = fft(sinWave);
for i = 1: ceil(size(fftAns, 2) / 2) %from k=0 to k=0.5
    fftMag(i) = sqrt((real(fftAns(i)))^2 + (imag(fftAns(i)))^2);
end

freqAxis = 0:Fs/N:Fs/2;

figure(1);
subplot(1,2,1)
plot(goertzelMag)
xlabel('Frequency (Hz)', 'fontsize', 16)
ylabel('Magnitude', 'fontsize', 16)
axis([ 0 2000 0 120])

subplot(1,2,2)
plot(freqAxis, fftMag)
xlabel('Frequency (Hz)', 'fontsize', 16)
ylabel('Magnitude', 'fontsize', 16)
axis([ 0 2000 0 120])
