clc;
clear;

maxFreq = 2000;
magnitudeResult = zeros(maxFreq);
phaseResult = zeros(maxFreq);
N = 205; %need to choose this to get the best result for 770Hz.

for i = 1:maxFreq
    signal = sin_generator(i,8000,N);
    [magnitudeResult(i), phaseResult(i)] = goertzel(signal, 770, 8000, N);
    phaseResult(i) = phaseResult(i) * 180 / pi;
end

set(gca,'fontsize',10)
figure(1);
plot(20*log(magnitudeResult))
xlabel('Frequency (Hz)', 'fontsize', 16)
ylabel('Magnitude (dB)', 'fontsize', 16)
axis([0 2000 -150 100])

figure(2);
phaseResult = unwrap(phaseResult);
plot(phaseResult)
xlabel('Frequency (Hz)', 'fontsize', 16)
ylabel('Angle (Degrees)', 'fontsize', 16)