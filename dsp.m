% Take the full signal data, and use the goertzel algorithm to determine
% what keys have been pressed

function [sequence] = dsp(sample)
    N = 205;
    fs = 8000;

    m = mean(sample);
    phone_data = sample - m;

    past1_pressed = [];
    past2_pressed = [];
    past1_detected = [];
    past2_detected = [];
    sequence = [];

    for i = 1:round(N/2):size(phone_data, 2) - N
        % Take a sample of size N and find what key is being pressed
        sample = phone_data(i:i+N-1);
        current = key_pressed(sample, fs);
        key = key_detection(current, past1_pressed, past2_pressed);

        % If a key has been detected and it was detected last time, then
        % it is a hold and not a new key press
        if size(key,2) ~= 0 && size(past1_detected,2) == 0 && size(past2_detected,2) == 0
            sequence = [sequence, key]; %#ok<AGROW>
        elseif size(key,2) ~= 0
            for j = 1:size(key,2) % Iterate through the current key
                detected = 0;
                for k = 1:size(past1_detected, 2) % Iterate through past key
                    if key(j) == past1_detected(k) % If a key press is detected,
                        detected = 1;              % record that fact
                    end
                end
                for k = 1:size(past2_detected, 2) % Iterate through past key
                    if key(j) == past2_detected(k) % If a key press is detected,
                        detected = 1;              % record that fact
                    end
                end            
                if detected == 0 % If they key was not detected, add it to the sequence
                    sequence = [sequence, key(j)];%#ok<AGROW>
                end
            end
        end

        % Update the variables keeping track of past samples and key presses
        past2_pressed = past1_pressed;
        past1_pressed = current;
        past2_detected = past1_detected;
        past1_detected = key;

    end
end
