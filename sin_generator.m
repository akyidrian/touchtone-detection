% Generates a sin wave with frequency sin_freq, with a sampling frequency
% of sampling_freq. Sin wave will be length long
function [wave] = sin_generator(sin_freq, sampling_freq, length)
    t = 0 : 1/sampling_freq : length/sampling_freq;
    wave = sin(2*pi*sin_freq.*t);
end