% Read in all the data files, and print out the key sequence that is
% detected

clc;
clear;

phone_data = dlmread('Telecom.txt', '/');
Telecom = dsp(phone_data)

phone_data = dlmread('TwoDegrees.txt', '/');
TwoDegrees = dsp(phone_data)

phone_data = dlmread('Vodafone.txt', '/');
Vodafone = dsp(phone_data)

phone_data = dlmread('Yabba.txt', '/');
Yabba = dsp(phone_data)

phone_data = dlmread('group11data.txt', '/');
group11Data = dsp(phone_data)
