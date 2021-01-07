%%  DSP Lab 2
% Author: Colin Morentin
% Date:  5-02-2018
% Function: Demonstrate understanding of DSP concepts
% Version:    2.0
%% Section 1
%a
t   = 0:7;                          % defines a short time interval

s1  = 2.*cos(2.*pi.*(t./4)+(pi/3)); % define a periodic signal

FF1 = fft(s1)./8;                   % taking the fast fourier transform
                                    % of the generated signal; however  
                                    % the output is scaled by the number 
                                    % of points in the signal
                                    
FF1 = fftshift(FF1);                % fftshift reorders the output of 
                                    % the signal, so that the the user can 
                                    % view the origin centered around the
                                    % output 
                                    % original : [1 2 3 4 5 6 7 8]
                                    % fftshift : [4 5 6 7 1 2 3 4] 

n = -4:3;                           % These are the values of n that are
                                    % of interest in the frequency domain
                                    
Mag1 = sqrt(real(FF1).^2 + imag(FF1).^2);
                                    % generating the magntiude of the
                                    % output
                                    % signal by find the square root of the
                                    % sum of the square of the imaginary
                                    % and real part of the signal
                                    
angleFF1 = atan(imag(FF1)./real(FF1)) * (180./pi);
                                    % calculating the phase angle of the
                                    % output by finding the arctan of the
                                    % imaginary portion of the signal
                                    % divided by the real part of the
                                    % signal

angleFF1(2:2:end) = 0;              % removing irrelevant phase angles 
                                    % don't appear on the magnitude graph

subplot(3,2,1)                      % creating a 3x2 figure matrix 

stem(n.*(1/8),Mag1,'-b');             % plotting the magntiude of the signal

xlabel('Normalized frequency (Hz)');  % label for the x-axis

ylabel('Magitude');                 % label for the y-axis                 

subplot(3,2,2)                      % adding a figure to the figure matrix

stem(n.*(1/8),angleFF1,'--r');      % plotting the phase angles of the signal

xlabel('Normalized Frequency (Hz)') % labeling the x-axis

ylabel('Phase Angle (Degrees)')     % labeling the y-axis

s2 = cos(2.*pi.*(t./4)) + 1;        % generating a new signal

FF2 = fft(s2)./8;                   % performing the fast fourier transform
                                    % scaled to the number of points in the
                                    % signal

FF2 = fftshift(FF2);                % reorganizing the signal

subplot(3,2,3)                      % creating a new entry into the figure
                                    % matrix
                                    
Mag2 = sqrt(real(FF2).^2 + imag(FF2).^2);
                                     % calculting the magntiude of the
                                     % signal

stem(n.*(1/8),Mag2,'-b');            % plotting the magntiude of the
                                     % new signal 

xlabel('Normalized Frequency (Hz)'); % label for the x-axis
                                        
ylabel('Magitude');                  % label for the y-axis

subplot(3,2,4)                       % adding a new figure to the figure 
                                     % matrix

angleFF2 = round(atan(imag(FF2)./real(FF2)) * (180./pi));
                                     % calculting the phase angle of the
                                     % signal; however the rounding
                                     % function is utilized to ensure that
                                     % the phase angle is zero for the
                                     % output.
                                     
stem(n .* (1/8),angleFF2,'--r');      % plotting the phase angle 

xlabel('Normalized Frequency (Hz)')  % label for the x-axis

ylabel('Phase Angle (Degrees)')      % label for the y-axis

s3 = cos(2.*pi.*(t./4)) + cos(2*pi*(t/8)-(pi/2)) + 1;
% generating a new signal for analysis; however I converted sine to cosine
% just for my own understanding
FF3 = fft(s3)./8;
% performing the fast fourier transfrom scaled to the number of points in
% the signal 
FF3 = fftshift(FF3);
% reordering the signal for analsysi 
subplot(3,2,5)
% adding to the figure matrix
Mag3 = sqrt(real(FF3).^2 + imag(FF3).^2);
% calculating the magntiude of the output
stem(n.*(1/8),Mag3,'-b');
% plotting the output of of the third signal 
xlabel('Normalized Frequency (Hz)');
% labeling the x-axis
ylabel('Magitude');
% labeling the y-axis

subplot(3,2,6)
% adding a figure to the figure matrix
angleFF3 = -round(atan(imag(FF3)./real(FF3)) * (180./pi));
% calculating the phase angle of the signal; however a negative sign is
% added to the output
angleFF3(2:6:end) = 0;
% eliminating phase angle that are irrelevant
stem(n.*(1/8),angleFF3,'--r');
% outputting the phase angle scaled to the number of points in the signal
xlabel('Normalized Frequency (Hz)')
% outputting the x-axis of the signal
ylabel('Phase Angle (Degrees)')
% labeling the y-axis of the signal

%%
clc,clear               
% eliminating all previous data 
N = linspace(0,2,2^11);
% creating a time array of two seconds with 2^11 points
f = 1/2;
ss = 2.*cos(2.*pi.*f.*(N));
% creating a cosine wave with a amplitude of 2 and a period of 2
figure(1)
% creating a seperate figure
plot(N,ss)
xlabel('Time(N)')
%labeling the x-axis
ylabel('Magntiude')
%labeling the y-axis
% plotting the signal as a function of time, and confirming that the period
% is 2 seconds
cn = fft(ss)./N;
% finding the fourier series of the signal scaled to the number of points
% in the signal
cn = fftshift(cn);
%reorganizing the signal for analysis
figure(2)
Mag = abs(cn) / 1048576;
% calculating the magntiude of the output however for some reason I have to
% scale it by 2^20 to get get the correct magnitude
stem(N.*(1./(2048)),Mag)
% plotting the output of of the third signal 
xlabel('Normalized Frequency (Hz)');
% labeling the x-axis
ylabel('Magitude');
% labeling the y-axis
figure(3)
angle = (atan(imag(cn)./real(cn)));
% calculating the phase angle of the signal; however a negative sign is
% added to the output
stem(N.*(1/(2048)),angle,'--r');
% outputting the phase angle scaled to the number of points in the signal
xlabel('Normalized Frequency (Hz)')
% outputting the x-axis of the signal
ylabel('Phase Angle (radians)')
% labeling the y-axis of the signal
figure(4)
% creating a new figure for the output
n = N.*(1/(2048));
% creating a frequency range for analysis
subplot(2,1,1)
% creating a  figure matrix
stem(n,real(cn)/(2^20), '-b');
%graphing the real portion of the signal
xlabel('Normalized Frequency (Hz)');
% labeling the x-axis
ylabel('Real Magitude');
% labeling the y-axis
subplot(2,1,2)
%adding to the figure matrix
stem(n,(imag(cn)/(2^20)), '--r');
xlabel('Normalized Frequency (Hz)')
% outputting the x-axis of the signal
ylabel('Imaginary Magntiude')
% labeling the y-axis of the signal




%%
ss = 2.*cos(2.*pi.*f.*(N) + pi/2); 
% generating a new signal with it out of phase by pi/2
cn = fft(ss)./N;
% finding the fourier series of the signal scaled to the number of points
% in the signal
cn = fftshift(cn);
%reorganizing the signal for analysis
Mag = abs(cn) / 1048576;
% calculating the magntiude of the output however for some reason I have to
% scale it by 2^20 to get get the correct magnitude
subplot(2,1,1)
stem(N.*(1./(2048)),Mag)
% plotting the output of of the third signal 
xlabel('Normalized Frequency (Hz)');
% labeling the x-axis
ylabel('Magitude');
% labeling the y-axis
subplot(2,1,2)
% adding a figure to the figure matrix
angle = (atan(imag(cn)./real(cn)));
% calculating the phase angle of the signal; however a negative sign is
% added to the output
stem(N.*(1/(2048)),angle,'--r');
% outputting the phase angle scaled to the number of points in the signal
xlabel('Normalized Frequency (Hz)')
% outputting the x-axis of the signal
ylabel('Phase Angle (radians)')
% labeling the y-axis of the signal
figure(2)
% creating a new figure for the output
n = N.*(1/(2048));
% creating a frequency range for analysis
subplot(2,1,1)
% creating a  figure matrix
stem(n,real(cn)/(2^20), '-b');
%graphing the real portion of the signal
xlabel('Normalized Frequency (Hz)');
% labeling the x-axis
ylabel('Real Magitude');
% labeling the y-axis
subplot(2,1,2)
%adding to the figure matrix
stem(n,(imag(cn)/(2^20)), '--r');
%graphing the imaginary portion of the signal
xlabel('Normalized Frequency (Hz)')
% outputting the x-axis of the signal
ylabel('Imaginary Magntiude')
% labeling the y-axis of the signal

%%
clc,clear all
prompt = {'Inital Frequency:', 'Final Freqency:'...%labeling the user input
    'Duration:', 'Sampling Rate', 'slope'};
dlg_title = 'Input';                               %denoting the title of the user input box
num_lines = 1;                                     %saying how many lines of input there will be per variable                 
default = {'1','42','1','1','42'};
data = inputdlg(prompt,dlg_title,num_lines, default);%saving the user input into a cell
f0 = str2double(cell2mat(data(1)));                % the inital frequency
ff = str2double(cell2mat(data(2)));                % the final frequency 
dur = str2double(cell2mat(data(3)));               % the duration of the signal
fs = str2double(cell2mat(data(4)));                % the sampling rate
slope = str2double(cell2mat(data(5)));             % the mu of psi
dt = 1/fs;                                         % the change in time per sample
tt = 0:dt:dur;                                     % A vector holding the number of points in the signal 
if(ff == 42)                                       % sentiel to ensure that 
                                                   %the final frequency is
                                                   %found when it is the
                                                   %unknown
                                                   % if that is the unknown
ff = slope.*(2.*dur)+ f0;                          %calculating the final freqeuncy if slope is given
end
if (slope == 42)                                   % A sentinel to calculate the slope when it is 
                                                   % the unknown variable
    slope = (ff-f0)./(2.*dur);
end
mu = (ff - f0) ./ (2.*dur);                        %calculating the variable of psi
psi = 2 .* pi .*(f0.* tt + mu .* tt .* tt + f0);   %a variable holding all changes in the sinusoidal signal
xx = real(exp(j*psi));                             %getting the real portion of the output of the signal
soundsc(xx,fs)                                     %outputting the signal as a sound
spectrogram(xx,1024,[],1024,fs,'yaxis')            %graphing the signal as a function of frequency and magnitude
%%
clear all, clc
prompt = {'Center Frequency:', 'Deviation Freqency:'...%labeling the user input
    'Duration:', 'Sampling Rate'};
dlg_title = 'Input';                                   %denoting the title of the user input box
num_lines = 1;                                         %saying how many lines of input there will be per variable                 
default = {'1','1','1','1'};
data = inputdlg(prompt,dlg_title,num_lines,default);   %saving the user input into a cell
fc = str2double(cell2mat(data(1)));                    %the center frequency
fm = str2double(cell2mat(data(2)));                    %the deviation frequency 
dur = str2double(cell2mat(data(3)));                   %the duration of the signal
fs = str2double(cell2mat(data(4)));                    %the sampling rate
dt = 1/fs;                                             %the change in time per sample
tt = 0:dt:dur;                                         %A vector holding the number of points in the signal 
s = cos(2.*pi.*(fc-fm).*tt) + cos(2.*pi.*(fc+fm).*tt); %summing the two signal together
soundsc(s,fs)                                          %outputting the signal as a sound
spectrogram(s,1024,[],1024,fs,'yaxis')                 %graphing the signal as a function of frequency and magnitude
%%
clc,clear
prompt = {'fc','fm', 'Io' ,'tau:','Duration:', 'Sampling Rate'};         
%getting user input
dlg_title = 'Input';                                                     
%denoting the title of the user input box
num_lines = 1;                                                           
%saying how many lines of input there will be per variable                 
default = {'1','1','1','1','1','1'};
data = inputdlg(prompt,dlg_title,num_lines,default);                     
%saving the user input into a cell
fc = str2double(cell2mat(data(1)));                                      
%the center frequency
fm = str2double(cell2mat(data(2)));                                      
%the deviation frequency 
Io = str2double(cell2mat(data(3)));                                      
%the scale factor for modulation
tau = str2double(cell2mat(data(4)));                                     
%decay paramter for A(t) and I(t)
dur = str2double(cell2mat(data(5)));                                     
%the duration of the signal
fs = str2double(cell2mat(data(6)));                                      
%the sampling rate
dt = 1/fs;                                                               
%the change in time per sample
tt = 0:dt:dur;                                                           
%A vector holding the number of points in the signal 
A_t = exp(-tt./tau);                                                     
%amplitude envelope
I_t = Io.*exp(-tt./tau);                                                 
%modulation indel envelope
psi = A_t .* cos(2.*pi.*fc.*tt + I_t .* cos(2.*pi.*fm.*tt));
%holding the signal 
soundsc(psi,fs)                                                           
%outputting the signal as a sound
spectrogram(psi,1024,[],1024,fs,'yaxis')
figure(2)
plot(tt,A_t)                        %plotting the amplitude envelope
xlabel('time(s)')                   %labeling the plot
ylabel('magnitude')
title('Amplitude envelope')
figure(3)
plot(tt,I_t)                        %plotting the modulation index
xlabel('time(s)')                   %labeling the plot
ylabel('magnitude')
title('modulation index envelope')
figure(4)
plot(tt,psi)                        %plotting the entire signal
xlabel('time(s)')                   %labeling the plot
ylabel('magnitude')
title('Entire Bell Signal')
figure(4)
plot(27450:27650,psi(27450:27650))
xlabel('time(s)')                   %labeling the plot
ylabel('magnitude')                 
