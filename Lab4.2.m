%% Deconvolution Experiment for 1-d Filters
bb = [1 -0.9];
% the coefficents at the FIR filter
xx = 256 .*(rem(0:100,50)<10);
% the input signal
nn = 0:length(xx);
% creating a vector the length of the  input signal
wn = firfilt(bb,xx);
% The output signal
subplot(2,1,1);
% creating a figure matrix
stem(xx);
% graphing the input signal
xlabel('Time Index (n)');
ylabel('Magnitude');
title('Output Signal');
% figure labels
axis([0 75 -inf inf])
% restricting the horizontal axis to the range 0<=n<=75
subplot(2,1,2)
% adding to the figure matrix
stem(wn,'filled');
% graphing the output signal
xlabel('Time Index (n)');
ylabel('Magnitude');
title('Output Signal');
% figure labels
axis([0 75 -inf inf])
% restricting the horizontal axis to the range 0<=n<=75
%% 3.1.1 Restoration Filter
y(1) = wn(1);                    % establishing the filter 2 based upon the 
for i = 2:22                     % given equation 
    y(i) = 0.9.^(i) * wn(i);
end
y1 = sum(y);                     % finalizing the FIR filter setup
yn = firfilt(y1,xx);             % performing convolution
subplot(2,1,1);                  % creating a figure matrix
stem(xx);                        % graping the orignal signal
axis([0 50 -inf inf])            % limiting the x axis
subplot(2,1,2)                   % adding to the figure matrix
stem(yn,'filled');               % altering the appearance of the output    
xlabel('Time Index (n)');        % providing an a-axis label
axis([0 50 -inf inf])            % limiting the a-axis

error = yn-xx;                   % calculating error between two signals
plot(error);                     % plotting the rror
axis([0 50 -inf inf])            % limiting the x axis
xlabel('Time Index (n)');        % providing axis labels
ylabel('error')

MaxError = max(error);           % using the max function to find the 
                                 % the maximum error
%% echo filter

