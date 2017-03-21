% Takes in tone data and figures out which key has been pressed. Note, that
% several iterations of this method may be needed to ensure a key has been
% pressed.

function [success] = Find_N_key_pressed(sample, sample_rate)

    N = size(sample, 2);
    frequencies = [697, 770, 852, 941, 1209, 1336, 1477, 1633];
    success = [];

    for i = 1:size(frequencies, 2)
       result = goertzel(sample, frequencies(i), sample_rate, N);
       if result > 1500 %need to adjust this automatically depending on noise
           success = [success, frequencies(i)]; %#ok<*AGROW>
       end
    end
end