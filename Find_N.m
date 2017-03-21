% Create a signal with all buttons pushed
% Find the values of N that can successfully detect all frequencies
% Written by Aydin Arik & Scott Bamford
clc;
clear;

N = 360;
frequencies = [697, 770, 852, 941, 1209, 1336, 1477, 1633];
sinusoid = 0;
Fs = 8000;

for i = 1:size(frequencies, 2)
    sinusoid = sinusoid + sin_generator(frequencies(i), Fs, N);
end

multiplier = 128 / max(sinusoid);
sinusoid = multiplier * sinusoid;

for i = 1:N
    result = Find_N_key_pressed(sinusoid(1:i), Fs);
    if (size(result,2) == size(frequencies, 2))%all frequencies present
        i
    end
end