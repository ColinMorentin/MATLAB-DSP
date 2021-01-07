%%  DSP Lab 1
% Author: Colin Morentin
% Date:  2-13-2018
% Function: Demonstrate understanding of DSP concepts
% Version:    3.0
%% Part 1
Fs = 11025; 
% defining the sampling frequency
recobj = audiorecorder(Fs, 16, 2); 
% audiorecorder is a MATLAB function that creates an audio object
% for recording audio.
% In this instance the function call has the following arguments:
% sample rate (Fs) in Hz, the sample size in bits,
% and the number of channels (mono or stereo).
% An audio object that has  a sampling rate of 11026 Hz, 
% a sample size of 16 bits, and a stereo channel.
% The object for recording audio is being saved to the variable recobj
disp('start speaking'); 
% The display function prints variables or strings of characters to the 
% terminal.
% In this instance the display function is being used to 
% indicate that audio data will start to be recorded.
recordblocking(recobj,3);
% The recordblocking function records audio to an audiorecroder object
% for a specified length in seconds.
% The audio data in being stored in the reobj variable for three seconds.
disp('End');
% The display function is being used to indicate that audio data will no
% longer be recorded.
play(recobj);
% The play function plays the audio object from beginning to end.
mydata = getaudiodata(recobj);
% The getaudiodata function returns the recroded audio data associated
% with the audio object in an array of data type double unless specified.
n = 0:33074;
% a variable to hold the number of sampling points
subplot(1,2,1)
% the subplot function enables multiple plots to presented in the same
% figure. This specific command enables a total of 2 possible graphs to be
% presented in a manner with 1 rows and 2 columns. 
plot(mydata);
%plotting the set of data for the first audio recording of fs 11025
title('11025 Fs in  the Frequency Domain');
%giving a title for the graph for an audio signal of fs 11025
xlabel('Fs (hz)');
%plotting the data in the frequency domain
subplot(1,2,2)
% indicating the next plot should be put in the second slot of the figure
% matrix
plot(n/Fs,mydata);
% plotting the first audio signal in the time domain 
title('11025 Fs in the Time Domain');
% indicating the title of the presented graph
xlabel('Time(s)');
% Questions
% a. What is the maximum frequency played back?
% 
% The maximum freqency played back is half of the sampling rate. In this 
% instance the maximum freqency played back is 5513hz
% 
% b. What does the x axis represent?
% 
% The x axis represents the number of  sampling points of the signal
% 
% c. Explain the quality of what you hear? Does the sound graph have any
% features that you can identify?
% 
% The quality of what you hear depends upon the number of sampling points
% and the range of signed bits to record a given signal. Yes at different
% pitches there are unique features displayed in the graph. The audio
% quality for a 11025 samping rate seemed sufficent to capture the recorded
% audio at an acceptablel level.
% 
% e. What does the y axis value represent? Explain?
% 0
% the y axis represents the signed bit representation of a system having
% 2^16 bits of data storage. Thus the y axis represents the magnitude of
% the recorded signal in decibels.
% 
% f. Change Fs argument in audio recorder to 5000 and repeat part a and b?
% 
% the maximum frequency played back in 2500 Hz
% the x axis represents the number of samples in the signal
%%
Fs2 = 5000;
% indicating the new sampling rate of the signal 
n2 = 0:14999;
% indicating the total number of sampling points in a three second interval.
% This number is defined so that the function can be converted into the time
% domain
recobj2 = audiorecorder(Fs2, 16, 2);
% recording the same phrase with a different sampling rate 
disp('start speaking');
% indicating to the user that they should start speaking
recordblocking(recobj2,3);
% the funciton indicates that a recording will be made for the next three
% seconds 
disp('End');
% indicating to the user that three seconds have passed and are no longer
% being recorded.
play(recobj2);
% the recording will now be played with the new sampling rate for
% comparison
mydata2 = getaudiodata(recobj2);
% the specific audio recording will be saved in terms of magnitude and
% sampling points
subplot(1,2,1)
% indicating that the data will be saved in the first spot of a 1x2 figure
% matrix
plot(mydata2);
% plotting the data for the second audio signal 
xlabel('Fs(Hz)');
% labeling the x axis of the audio singal 2 plot
title('5000 Fs in the Frequency Domain');
% giving a title of the audio signal 2 plot
subplot(1,2,2)
% indicating the time domain plot of singal 2 will be placed in slot 2 of
% the figure matrix
plot(n2/Fs2,mydata2);
% plotting audio signal two in the time domain
xlabel('Time(s)');
% Giving a label to the x axis of the second figure 
title('5000 Fs in the Time Domain');
% giving a title to the time domain graph
%g. How does the recording sound?
%
%
%%
Fs3 = 44000;
% defining a new sampling rate for the third audio recording
n3 = 0:131999;
% indicating the number of audio samples for a three second recording given
% the defined sampling rate
recobj3 = audiorecorder(Fs3, 16, 2);
% creating a new audio object to hold the third recording given new
% parameters for the sampling rate
disp('start speaking');
% indicating that a new audio recording will be taken
recordblocking(recobj3,3);
% storing data from the input of the audio device for a total of three
% seconds
disp('End');
% indicating to the user the audio recording device is no longer collecting
% input
play(recobj3);
% playing back the third audio recording with the new sampling rate
mydata3 = getaudiodata(recobj3);
% saving the third audio fileinto a new object
subplot(1,2,1)
% saving the third audio file plot into the first slot of a figure
% matrix that is in the frequency domain
plot(mydata3);
%plotting the data of the third audio file 
xlabel('Fs(Hz)');
%labeling the the x axis of the third audio recording in the frequency
%domain
title('Signal with 44000 Fs');
%giving a title to the third audio file in the frequency domain
subplot(1,2,2)
% denoting the second slot of the figure matrix for the third audio file
plot(n3/Fs3,mydata3);
% plotting the third audio file in the time domain
xlabel('Time(s)');
% labeling the x axis for the third audio file in the time domain
title('Signal with 44000 Fs');
%h Change Fs to 44000. Repeat part a, b and g 
% the maximum frequency played back is 22000
% the x axis represents the number of samples in the signal
% the recorde sounds like

%% Part 2
clc
%clear the command window
clear
% compl;letely clears the MATLAB workspace 
close all;
% closes any open file in MATLAB
t = -8.0:0.001:8;
% creating an index for the time 
s1 = rectpuls(t);
% rectpuls returns a continuous, aperiodic, unity height rectangular pulse
% with a default width of 1 within the time interval specified by t
s2 = rectpuls(t/4);
% expanding the function of the original pulse function by a factor of 4 
s3 = rectpuls(3.*t-1);
% compressing the pules by a factor of 3 and shifting it over to the right
% by 1
% a. 
% 
% Based upon my knowledge of 310 the presented signals are matching up with
% the properties of time scaling and shifting. Signal s2 provides a signal
% expansion of a factor of 4, for the integral of the original signal
% yields 1, and the second signal yields a value of 4. The signal s3
% demonstrates a time compression and time shift, for the original signal
% has been compressed by a factor of 3 and shifted to the right by 1
% second. 
%
% b. 
% the energy of a signal is the integral of the function squared, so for a
% discrete time signal would be the sum of every point squared. Thus the
% sum function was utilized to sum every single point of the signal.
energy1 = sum(s1.^2);
fprintf('The sum of the energy of signal 1 is %.2gJ\n', energy1);
energy2 = sum(s2.^2);
fprintf('The sum of the energy of signal 2 is %.2gJ\n', energy2);
energy3 = sum(s3.^2);
fprintf('The sum of the energy of signal 3 is %.2gJ\n', energy3);

%c 
s1 = rectpuls(t);
% rectpuls returns a continuous, aperiodic, unity height rectangular pulse
% with a default width of 1 within the time interval specified by t
s2 = rectpuls(t/4);
% expanding the function of the original pulse function by a factor of 4 
s3 = rectpuls(3.*t-1);
% compressing the pules by
% a factor of 3 and shifting the original pulse 1
% unit to the right
subplot(2,2,1)
%creating a figure matrix to show all pulses in the same graph
plot(t,s1,'linewidth',2);
% plotting the first signal with a larger line width
title('rectpuls(t)')
% labeling the first signal with the function used to generate it
xlabel('time (sec)');
% labeling the x axis of the first signal
ylabel('amplitude');
% labeling the y axis of the first signal
grid on;
% adding a grid to the graph to make it easier to read the graph
axis([-8 8 -4 4]);
% denoating the range of the x axis and the y axis 
subplot(2,2,2)
% adding the second signal to the figure matrix
plot(t,s2,'g','linewidth',2);
% plotting the second signal with a a wider line width and in the color
% green
title('rectpuls(t/4)')
% denoating the signal utilized to generate the signal as the title
xlabel('time (sec)');
% labelig the x axis for the signal
ylabel('amplitude')
% labeling the y axis for the signal
grid on;
% adding to grid to make the graph more readable
axis([-8 8 -4 4]);
% changing the scope of the graph 
subplot(2,2,3)
% adding another plot to the 2x2 figure matrix
plot(t,s3,'r','linewidth',2);
% plotting the third signal with a larger line width in red
title('rectpuls(3.*t-1)');
% adding a title to the third signal that denotes how the signal was made
xlabel('time (sec)');
% adding a label for the x axis for the third signal
ylabel('amplitude');
% adding a label for the y axis for the third signal
grid on;
% adding a grid to make the graph more legible 
axis([-8 8 -4 4]);
% changing the range of the plot for the third item in the figure
subplot(2,2,4)
%adding another plot to the figure matrix
plot(t,s1,'linewidth',2);
% plotting the two different variables and specifing to increase the line
% width of the presented function
hold on
% hold on enables matlab to hold the desired function to be printed 
plot(t,s2,'g','linewidth',2);
% plotting the expanded signal and specifying the color of the presented 
% signal to a green color
hold on 
% hold on enables matlab to hold the desired function to be printed 
plot(t,s3,'r','linewidth',2);
% plotting the compressed signal and shifted signal. The color has also 
% been specified to be red to display the signal
hold off
% hold off enables matlab to print all saved plots into a single figure 
grid on;
% MATLAB will add a grid onto the presented figure to make rapid point
% differentiation easier.
axis([-8 8 -4 4]);
% The axis function will limit the presented function in the x and y axis.
% The specific commmand will limit the range of the presented x axis to -8
% to 8 , and the presented range of y axis to -4 to 4.
xlabel('time (sec)');
% xlabel function will add a label to x axis of the presented figure, 
% this label depends upon the string of characters added to its argument.
ylabel('amplitude');
% ylabel function will add a label to y axis of the presented figure, 
% this label depends upon the string of characters added to its argument.
title('Signal Analysis');
% title function will add a label to top of the the presented figure, 
% this label depends upon the string of characters added to its argument.
saveas(gcf,'lab1a.png');
%saving the figure as an image file
figure(2)
%starting the plot in a new figure
new_s =conv(s1,s2,'same');
% performing the convolution between the first signal and the second signal,
% and the same command is being utilizied so that the same interval is
% being uilizied
new_s = new_s / 1000;
% the sampling rate is at 1000, so the scaling must be reduced to make the
% convolution make sense 
plot(t,new_s,'linewidth',2)
% the convolutoin is graphed in a new figure
xlabel('time(t)');
%gives a label to the x axis of the convolution
ylabel('Amplitude');
%gives a label the the y-axis of the convolution
title('Convolution of rectpuls(t) and rectpuls(t/4)');
%% Part 3
clc, clear
Fs = 100;
%the sampling rate
n = 0:8;
% the index 
subplot(3,2,1)
%figure matrix
plot([0,8], [1,1])
%plotting a horizonal line
xlabel('Time(s)')
%labeling x-axis
ylabel('Amplitude')
%labeling y-axis
title('1');
%titleing the function
X2 = [0,0,0,1,1,1,1,1,1];
%utilizing distinct points instead of the heaviside function
subplot(3,2,2)
%new entry into figure matrix
plot(n,X2)
%plotting the dirac delta function
xlabel('Time(s)')
%labeling the x axis
ylabel('Amplitude')
%labeling the y axis
title('d(t-3)')
%titling the graph
axis([0 8 -1 2])
%giving bounds for better viewing
n = 0:159;
%new index so that 8 periods are shown
X3 = 2.*cos(2.*pi.*n.*(5/Fs));
%sinusoid function 
subplot(3,2,3)
%new entry for figure matrix
plot(n/Fs,X3)
%plotting the sinusoidal signal
xlabel('Time(s)')
%labeling the x-axis
ylabel('Amplitude')
%labeling the y-axis
title('2cos(10*pi*t)')
%giving a title the the graph
n = 0:39;
%new index to show 8 periods of the next function
X4 = cos(2.*pi.*n.*(20/Fs));
%new sinusoidal function
subplot(3,2,4)
%setting new entry for figure matrix
plot(n/Fs,X4)
%plotting thew new sinusoid function
xlabel('Time(s)')
%labeling the x-axis
ylabel('Amplitude')
%labeling the y-axis
title('cos(40*pi*t)')
%giving a title to the new function
n = 0:15;
%chosing a new index to display 8 periods of the function
x5 = cos(100.*pi.*n.*(50/Fs));
%new sinusoidal function
subplot(3,2,5)
%last entry for the figure matrix
plot(n/Fs,x5);
%plotting the last sinusoidal function in terms of time
xlabel('Time(s)')
%labeling the x-axis
ylabel('Amplitude')
%labeling the y-axis
title('cos(100*pi*t)')
%labeling the graph
%%
t = -8.0:0.001:8;
s2 = rectpuls(t/4);
%restating the s2 of part 2 for convolution
subplot(1,3,1)
%starting 1x3 figure matrix
plot(t,s2);
%plotting s3
title('rectpuls(t/4');
subplot(1,3,2)
%new figure matrix entry
X3 = 2.*cos(pi.*10.*t);
%stating x3 in terms of t for easier comparison
plot(t,X3)
title('2.*cos(pi.*10.*t)');
%plotting in3(t)
subplot(1,3,3)
%last input of figure matrix
foo = conv(X3,s2,'same').* .001;
%performing convolution
plot(foo)
title('Convolution');
%%
clc, clear
%clearing the workspace and command window
t = -8.0:0.001:8;
s1 = rectpuls(t);
s2 = rectpuls(t/4);
s3 = rectpuls(3.*t-1);
%reitilizing variables from part 2
cheese1 = fftshift(abs(fft(s1)))/1000;

%peforming the fast fourier transform on the funciton, taking the
%absolute value to get the magntiude of the function, and finally shifting
%the output of the function so that both sides of the signal are presented
%instead of half. Also a normalization of the values is performed to
%maintain acceptable magnitude readings
subplot(3,2,1)
%creating a figure matrix to present all figures at once.
plot(t,cheese1);
%plotting the fft of s1
xlabel('time(s)');
%labeling the x-axis
ylabel('magntiude');
%labeling the y-axis
title('sinc(t)');
%giving a title to the graph
cheese12 = fftshift(angle(fft(s1))/1000);
%taking the angle of the fft to get the phase
subplot(3,2,2)
%creating a figure matrix to present all figures at once.
plot(t,cheese12);
%plotting the fft of s1
xlabel('time(s)');
%labeling the x-axis
ylabel('phase');
%labeling the y-axis
title('sinc(t)');
%giving a title to the graph

cheese2 = fftshift(abs(fft(s2)))/1000;
%peforming the fast fourier transform on the funciton, taking the
%absolute value to get the magntiude of the function, and finally shifting
%the output of the function so that both sides of the signal are presented
%instead of half
subplot(3,2,3)
plot(t,cheese2)
xlabel('time(s)');
%labeling the x-axis
ylabel('magntiude');
%labeling the y-axis
title('sinc(t/4)');
%giving a title to the graph

cheese22 = fftshift(angle(fft(s1))/1000);
subplot(3,2,4)
%creating a figure matrix to present all figures at once.
plot(t,cheese22);
%plotting the fft of s1
xlabel('time(s)');
%labeling the x-axis
ylabel('phase');
%labeling the y-axis
title('sinc(t/4)');
%giving a title to the graph

cheese3 = fftshift(abs(fft(s3)))/1000;
subplot(3,2,5)
plot(t,cheese3)
xlabel('time(s)');
%labeling the x-axis
ylabel('magntiude');
%labeling the y-axis
title('sinc(3t-1)');
%giving a title to the graph
cheese33 = fftshift(angle(fft(s1))/1000);
subplot(3,2,6)
%creating a figure matrix to present all figures at once.
plot(t,cheese33);
%plotting the fft of s1
xlabel('time(s)');
%labeling the x-axis
ylabel('phase');
%labeling the y-axis
title('sinc(3t-1)');
%giving a title to the graph

%%
%clearing the workspace and command window
t = -8.0:0.001:8;
s1 = rectpuls(t);
s2 = rectpuls(t/4);
s3 = rectpuls(3.*t-1);
%reitilizing variables from part 2
cheese1 = fftshift(abs(fft(s1)))/1000;
plot(t,cheese1)
