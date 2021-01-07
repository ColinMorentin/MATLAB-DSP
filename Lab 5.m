%% lab 5
clear, clc
p = [64 80 100];
roots(p)
z = [1 0.8 0.64];
roots(z)
%%
% H(z) = (1-(x+xi)z^-1)(1-(y+yi)z^-1)
%        ------------------------------
%        ((1-(a+ai)z^-1)(1-(b+bi)z^-1)
% I'm rewriting the transfer function in terms of it's real and imaginary
% portion
x = (0.9^(-1))*cos(pi/3);
% real portion of zero 1
xi = (0.9^(-1))*sin(pi/3)*i;
% imaginary portion of zero 1
y = (0.9^(-1))*cos(-pi/3);
% real portion of zero 2
yi = (0.9^(-1))*sin(-pi/3)*i;
% imaginary portion of zero 2
a = (0.9^(1))*cos(pi/3);
% real portion of pole 1
ai =(0.9^(1))*sin(pi/3)*i;
% imagnary portion of pole 1
b = (0.9^(1))*cos(-pi/3);
% real portion of pole 2
bi = (0.9^(1))*sin(-pi/3)*i;
% imaginary portion of pole 2
n1 = [1 -(x+xi)];
% coefficents of zero 1 
n2 = [1 -(y+yi)];
% coefficents of zero 2
num = conv(n1,n2).*8;
% performing convolution to do polynomial multiplication
d1 = [1 -(a+ai)];
% coefficents of pole 1
d2 = [1 -(b+bi)];
% coefficents of pole 2
denom = conv(d1,d2);
% performing conoluvtion to do polynomial multiplication

%%

% H(z) = (1-(x+xi)z^-1)(1-(y+yi)z^-1)
%        ------------------------------
%        ((1-(a+ai)z^-1)(1-(b+bi)z^-1)
% I'm rewriting the transfer function in terms of it's real and imaginary
% portion
r = 0.95;
% given value of r 
theta = pi/4;
% given value of theta
x = cos(theta);
% real portion of zero 1
xi = sin(theta)*i;
% imaginary portion of zero 1
y = cos(-theta);
% real portion of zero 2
yi = sin(-theta)*i;
% imaginary portion of zero 2
a = (r^(1))*cos(theta);
% real portion of pole 1
ai =(r^(1))*sin(theta)*i;
% imagnary portion of pole 1
b = (r^(1))*cos(-theta);
% real portion of pole 2
bi = (r^(1))*sin(-theta)*i;
% imaginary portion of pole 2
n1 = [1 -(x+xi)];
% coefficents of zero 1 
n2 = [1 -(y+yi)];
% coefficents of zero 2
num = conv(n1,n2);
% performing convolution to do polynomial multiplication
d1 = [1 -(a+ai)];
% coefficents of pole 1
d2 = [1 -(b+bi)];
% coefficents of pole 2
denom = conv(d1,d2);
% performing conoluvtion to do polynomial multiplication


%%
yy = filter([1,2],[1,-0.9],[1, zeros(1,50)]);
% IRR filter function 
stem(yy)
% plotting the output
xlabel('time index (n)');
ylabel('hn');
% figure labels
%%

%%
% H(z) = (1-(x+xi)z^-1)(1-(y+yi)z^-1)
%        ------------------------------
%        ((1-r(a+ai)z^-1)(1-r(b+bi)z^-1)
% I'm rewriting the transfer function in terms of it's real and imaginary
% portion
r = 0.95;
% given value of r 
fhat = (fint/fs1);
% finds the normalized frequency
theta = 2.*fhat*pi;
% calculates theta
x = cos(theta);
% real portion of zero 1
xi = sin(theta)*i;
% imaginary portion of zero 1
y = cos(-theta);
% real portion of zero 2
yi = sin(-theta)*i;
% imaginary portion of zero 2
a = (r^(1))*cos(theta);
% real portion of pole 1
ai =(r^(1))*sin(theta)*i;
% imagnary portion of pole 1
b = (r^(1))*cos(-theta);
% real portion of pole 2
bi = (r^(1))*sin(-theta)*i;
% imaginary portion of pole 2
n1 = [1 -(x+xi)];
% coefficents of zero 1 
n2 = [1 -(y+yi)];
% coefficents of zero 2
num = conv(n1,n2);
% performing convolution to do polynomial multiplication
d1 = [1 -(a+ai)];
% coefficents of pole 1
d2 = [1 -(b+bi)];
% coefficents of pole 2
denom = conv(d1,d2);
% performing conoluvtion to do polynomial multiplication

yy = filter(num,denom,signal);
% IRR filter function 
subplot(2,1,1)
% figure matrix
n = 1:length(signal);
% getting length of the signal for output
plot(n/fs1,signal)
% plotting the time domain signal
xlabel('time index (n)');
ylabel('hn');
% figure labels
axis([0 4 -inf inf])
% limiting figure perspective
subplot(2,1,2)
% addition to figure matrix
plot(n/fs1,yy)
% plotting the output
xlabel('time index (n)');
ylabel('hn');
axis([0 4 -inf inf])
% figure labels
figure(2)
% new window for figures
subplot(2,1,1)
% figure matrix
spectrogram(signal,1024,[],1024,fs1,'yaxis')
% graphing the input signal
subplot(2,1,2)
% addition to figure matrix
spectrogram(yy,1024,[],1024,fs1,'yaxis')
% graphing the filtered signal
