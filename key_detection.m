% Checks to see if the keys that have been detected in this sample have
% been detected in the past. If they have been detected in the last two
% samples, then they can be said to be a legitimate key press

function [key_detected] = key_detection(key_pressed, past1_key, past2_key)
    key_detected = [];
    for i = 1:size(key_pressed, 2)
        for j = 1:size(past1_key, 2)
            if key_pressed(i) == past1_key(j)
                for k = 1:size(past2_key, 2)
                    if key_pressed(i) == past2_key(k)
                        key_detected = [key_detected, key_pressed(i)]; %#ok<AGROW>
                    end
                end
            end
        end
    end
end