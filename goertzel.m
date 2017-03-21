% Implementation of the goertzel algorithm.
% To be used to see if "target_freq" is present in "input"

function [magnitude, phase] = goertzel(input, target_freq, sample_rate, N)

    %Calculate variables
    k = round(N*target_freq/sample_rate); % Always round to the closest 
    w = (2*pi / N) * k;
    cosine = cos(w);
    sine = sin(w);
    coeff = 2 * cosine;
    
    V1 = 0;
    V2 = 0;
    for i = 1:1:N
        V0 = coeff * V1 - V2 + input(i);
        V2 = V1;
        V1 = V0;
    end
    
    imag = sine * V1;
    real = cosine * V1 - V2;

    magnitude = sqrt(imag^2 + real^2);
    phase = atan2(imag, real);
end