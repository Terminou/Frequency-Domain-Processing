clear 
close all

img = imread('panda.png');

figure, imshow(img);
f=double(img);
h = size(f,1);
w = size(f,2);
% Create Butterworth low pass filter 
R = 60; % cutoff frequency
H = zeros(h,w);
n = 2; %order of the filter
for V=1:h
for U=1:w
    D = sqrt((V-h/2)^2 + (U-w/2)^2);
    H(V,U) = 1 / (1+ (D/R)^(2*n)); 
 end
 end

figure; imshow(H, []);
H = ifftshift(H); % put zero freq in upper left corner
%figure, imshow(H, []);
F = fft2(f);
G = H .* F;
figure; imshow(log(abs(fftshift(G))), []); %getting result in freq. domain
g = real(ifft2(G));
figure, imshow(g, []);
