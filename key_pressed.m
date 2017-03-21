% Takes in tone data and figures out which key has been pressed. Note, that
% several iterations of this method may be needed to ensure a key has been
% pressed.
% "betweenFreqs" is used to estimate the level of noise present in "sample"

function [button_pressed] = key_pressed(sample, sample_rate)

    threshold = 1250;
	N = size(sample, 2);
	frequencies = [697, 770, 852, 941, 1209, 1336, 1477, 1633];
%     betweenFreqs = [733.5, 811, 896.5, 1075, 1272.5, 1406.5, 1555];
	success = [];

	% Test the sample for each of the frequencies
    for i = 1:size(frequencies, 2)
	   mag = goertzel(sample, frequencies(i), sample_rate, N);
	   allMags(i) = mag; %#ok<AGROW>
    end
    
    % Test the sample for each of the frequencies
%     for i = 1:size(betweenFreqs, 2)
% 	   mag = goertzel(sample, betweenFreqs(i), sample_rate, N);
% 	   betMags(i) = mag; %#ok<AGROW>
%     end
    
%     averageMag = mean(allMags);
%     betweenMag = mean(betMags);    
%     num = (averageMag / (2 * betweenMag));
    
    % Filtering out frequencies which have a large enough threshold
	for i = 1:size(frequencies, 2)
	   if (allMags(i) > threshold)
		   success = [success, frequencies(i)]; %#ok<AGROW>
	   end
	end
	
	% Discover what frequencies are present in the sample
	success = ismember(frequencies, success);

	button_pressed = [];
	
	% Determine what button has been pressed
	if success(1) == 1
		if success(5) == 1
			button_pressed = [button_pressed, '1'];
		end
		if success(6) == 1
			button_pressed = [button_pressed, '2'];
		end
		if success(7) == 1
			button_pressed = [button_pressed, '3'];
		end
		if success(8) == 1
			button_pressed = [button_pressed, 'A'];
		end
	end

	if success(2) == 1
        if success(5) == 1
			button_pressed = [button_pressed, '4'];
        end
        if success(6) == 1
			button_pressed = [button_pressed, '5'];
        end
        if success(7) == 1
			button_pressed = [button_pressed, '6'];
        end
        if success(8) == 1
			button_pressed = [button_pressed, 'B'];
        end
	end

	if success(3) == 1
        if success(5) == 1
			button_pressed = [button_pressed, '7'];
        end
        if success(6) == 1
			button_pressed = [button_pressed, '8'];
        end
        if success(7) == 1
			button_pressed = [button_pressed, '9'];
        end
        if success(8) == 1
			button_pressed = [button_pressed, 'C'];
        end
	end

    if success(4) == 1
        if success(5) == 1
			button_pressed = [button_pressed, '*'];
        end
        if success(6) == 1
			button_pressed = [button_pressed, '0'];
        end
        if success(7) == 1
			button_pressed = [button_pressed, '#'];
        end
        if success(8) == 1
			button_pressed = [button_pressed, 'D'];
        end
    end    
end
