close all;
clear;

f = imread('ball.png');
figure, imshow(f, []);
F = fftshift(fft2(double(f)));
S = log(abs(F));
%imwrite( S/max(S(:)), 'ballMask.png');
% Edit image 'mask.tif' with another application such as "Paint".
% Draw black squares or circles at noise locations. Save it back
% to 'mask.tif‘.
%pause;
M = imread('ballMask.png');
M = M(:,:,1); % Use only first band of color image
M = double((M>0)); % Threshold, so 0's are at noise locations
G = M .* F;
g = real( ifft2( ifftshift(G) ) );
figure, imshow(g, []);
% f = imread('skull.png');
% figure, imshow(f, []);
% F = fftshift(fft2(double(f)));
% S = log(abs(F));
% imwrite( S/max(S(:)), 'skullMask.png');
% % Edit image 'mask.tif' with another application such as "Paint".
% % Draw black squares or circles at noise locations. Save it back
% % to 'mask.tif‘.
% pause;
% M = imread('skullMask.png');
% M = M(:,:,1); % Use only first band of color image
% M = double((M>0)); % Threshold, so 0's are at noise locations
% G = M .* F;
% g = real( ifft2( ifftshift(G) ) );

% f = imread('bone.png');
% figure, imshow(f, []);
% F = fftshift(fft2(double(f)));
% S = log(abs(F));
% imwrite( S/max(S(:)), 'boneMask.png');
% % Edit image 'mask.tif' with another application such as "Paint".
% % Draw black squares or circles at noise locations. Save it back
% % to 'mask.tif‘.
% pause;
% M = imread('boneMask.png');
% M = M(:,:,1); % Use only first band of color image
% M = double((M>0)); % Threshold, so 0's are at noise locations
% G = M .* F;
% g = real( ifft2( ifftshift(G) ) );