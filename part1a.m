clear 
close all

input = imread('panda.png');
figure; imshow(input);
f=double(input);

h = size(f,1);
w = size(f,2);
% Create ideal low pass filter – a circle in middle of image
R = 20; % cutoff frequency
H = zeros(h,w);

for v=1:h
for u=1:w
 if (v-h/2)^2 + (u-w/2)^2 < R^2
 H(v,u) = 1;
 end
 end
end

figure, imshow(H, []);
H = ifftshift(H); % put zero freq in upper left corner
figure, imshow(H, []);
F = fft2(f);
G = H .* F;
figure; imshow(log(abs(fftshift(G))), []); %getting result in freq. domain
g = real(ifft2(G));
figure, imshow(g, []);