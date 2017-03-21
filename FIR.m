% Plot the normalised magnitude and phase response of the optimal FIR filter
% and a comparison between the design and an ideal filter

clc;
clear;

fTransWidth = 25;
N = 205; %filter order
fs = 8000; %sampling freq.

f = [0 735 760 780 805 4000]; 
f = 2*f / fs; %normalised f

A = [0 0 1 1 0 0];

N = ceil((30*fs)/(22*fTransWidth));

b = firpm(N,f,A);
[h,w] = freqz(b,1,512);
figure(1);
freqz(b,1,2048);
figure(2)
plot(f,A,w/pi,abs(h))
xlabel('Frequency', 'fontsize', 16)
ylabel('(dB)', 'fontsize', 16)
legend('Ideal','firpm Design')