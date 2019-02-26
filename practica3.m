%% Practica 3 
% Lectura de imagenes
m1 = imread('museum1.jpeg');
m2 = imread('museum2.jpeg');
m3 = imread('museum3.jpeg');
tank = imread('tank.tif');
pens = imread('pens.tif');
clown = imread('clown.tif');
dollar = imread('dollar.tif');
%Conversion a HDR
files = {'museum1.jpeg','museum2.jpeg','museum3.jpeg'};
expTimes = [0.1000, 0.6250, 4.0000];
hdr = makehdr(files,'RelativeExposure',expTimes./expTimes(1));
imshow(hdr);
%conversion a RGB
rgb = tonemap(hdr);
figure
imshow(rgb);
%de rgb a grises
m1g = rgb2gray(m1);
m2g = rgb2gray(m2);
m3g = rgb2gray(m3);
%historgrama museo
figure
subplot(3,2,1);
imshow(m1g);
subplot(3,2,2);
imhist(m1g,64);
subplot(3,2,3);
imshow(m2g);
subplot(3,2,4);
imhist(m2g,64);
subplot(3,2,5);
imshow(m3g);
subplot(3,2,6);
imhist(m3g,64);
%histograma .tif
figure
subplot(4,2,1);
imshow(tank);
subplot(4,2,2);
imhist(tank,64);
subplot(4,2,3);
imshow(pens);
subplot(4,2,4);
imhist(pens,64);
subplot(4,2,5);
imshow(clown);
subplot(4,2,6);
imhist(clown,64);
subplot(4,2,7);
imshow(dollar);
subplot(4,2,8);
imhist(dollar,64);
%Negativos museo
m1_neg = imadjust(m1g, [0 1], [1 0]);
m2_neg = imadjust(m2g, [0 1], [1 0]);
m3_neg = imadjust(m3g, [0 1], [1 0]);
figure
subplot(3,2,1);
imshow(m1_neg);
subplot(3,2,2);
imhist(m1_neg,64);
subplot(3,2,3);
imshow(m2_neg);
subplot(3,2,4);
imhist(m2_neg,64);
subplot(3,2,5);
imshow(m3_neg);
subplot(3,2,6);
imhist(m3_neg,64);
%Negativos
tank_neg = imadjust(tank, [0 1], [1 0]);
pens_neg = imadjust(pens, [0 1], [1 0]);
clown_neg = imadjust(clown, [0 1], [1 0]);
dollar_neg = imadjust(dollar, [0 1], [1 0]);
figure
subplot(4,2,1);
imshow(tank_neg);
subplot(4,2,2);
imhist(tank_neg,64);
subplot(4,2,3);
imshow(pens_neg);
subplot(4,2,4);
imhist(pens_neg,64);
subplot(4,2,5);
imshow(clown_neg);
subplot(4,2,6);
imhist(clown_neg,64);
subplot(4,2,7);
imshow(dollar_neg);
subplot(4,2,8);
imhist(dollar_neg,64);
%Ecualizaci?n de histograma museo
m1_eq = histeq(m1g);
m2_eq = histeq(m2g);
m3_eq = histeq(m3g);
figure
subplot(3,2,1);
imshow(m1_eq);
subplot(3,2,2);
imhist(m1_eq,64);
subplot(3,2,3);
imshow(m2_eq);
subplot(3,2,4);
imhist(m2_eq,64);
subplot(3,2,5);
imshow(m3_eq);
subplot(3,2,6);
imhist(m3_eq,64);
%Ecualizaci?n de histograma
tank_eq = histeq(tank);
pens_eq = histeq(pens);
clown_eq = histeq(clown);
dollar_eq = histeq(dollar);
figure
subplot(4,2,1);
imshow(tank_eq);
subplot(4,2,2);
imhist(tank_eq,64);
subplot(4,2,3);
imshow(pens_eq);
subplot(4,2,4);
imhist(pens_eq,64);
subplot(4,2,5);
imshow(clown_eq);
subplot(4,2,6);
imhist(clown_eq,64);
subplot(4,2,7);
imshow(dollar_eq);
subplot(4,2,8);
imhist(dollar_eq,64);
%Funci?n logaritmica museo
m1_log = uint8(log(double(m1g)+1) .* ((255 - 1)/log(255)));
m2_log = uint8(log(double(m2g)+1) .* ((255 - 1)/log(255)));
m3_log = uint8(log(double(m3g)+1) .* ((255 - 1)/log(255)));
figure
subplot(3,2,1);
imshow(mat2gray(m1_log));
subplot(3,2,2);
imhist(mat2gray(m1_log),64);
subplot(3,2,3);
imshow(mat2gray(m2_log));
subplot(3,2,4);
imhist(mat2gray(m2_log),64);
subplot(3,2,5);
imshow(mat2gray(m3_log));
subplot(3,2,6);
imhist(mat2gray(m3_log),64);
%Funci?n logaritmica
tank_log = uint8(log(double(tank)+1) .* ((255 - 1)/log(255)));
pens_log = uint8(log(double(pens)+1) .* ((255 - 1)/log(255)));
clown_log = uint8(log(double(clown)+1) .* ((255 - 1)/log(255)));
dollar_log = uint8(log(double(dollar)+1) .* ((255 - 1)/log(255)));
figure
subplot(4,2,1);
imshow(mat2gray(tank_log));
subplot(4,2,2);
imhist(mat2gray(tank_log),64);
subplot(4,2,3);
imshow(mat2gray(pens_log));
subplot(4,2,4);
imhist(mat2gray(pens_log),64);
subplot(4,2,5);
imshow(mat2gray(clown_log));
subplot(4,2,6);
imhist(mat2gray(clown_log),64);
subplot(4,2,7);
imshow(mat2gray(dollar_log));
subplot(4,2,8);
imhist(mat2gray(dollar_log),64);
%Funci?n exponencial museo
m1_log = uint8((exp(double(m1g)) .^ (log(256) / (256-1))) - 1);
m2_log = uint8((exp(double(m2g)) .^ (log(256) / (256-1))) - 1);
m3_log = uint8((exp(double(m3g)) .^ (log(256) / (256-1))) - 1);
figure;
subplot(3,2,1);
imshow(mat2gray(m1_log));
subplot(3,2,2);
imhist(mat2gray(m1_log),64);
subplot(3,2,3);
imshow(mat2gray(m2_log));
subplot(3,2,4);
imhist(mat2gray(m2_log),64);
subplot(3,2,5);
imshow(mat2gray(m3_log));
subplot(3,2,6);
imhist(mat2gray(m3_log),64);
%Funci?n exponencial
tank_exp = uint8((exp(double(tank)) .^ (log(256) / (256-1))) - 1);
pens_log = uint8((exp(double(pens)) .^ (log(256) / (256-1))) - 1);
clown_log = uint8((exp(double(clown)) .^ (log(256) / (256-1))) - 1);
dollar_log = uint8((exp(double(dollar)) .^ (log(256) / (256-1))) - 1);
figure
subplot(4,2,1);
imshow(tank_exp);
subplot(4,2,2);
imhist(tank_exp,64);
subplot(4,2,3);
imshow(mat2gray(pens_log));
subplot(4,2,4);
imhist(mat2gray(pens_log),64);
subplot(4,2,5);
imshow(mat2gray(clown_log));
subplot(4,2,6);
imhist(mat2gray(clown_log),64);
subplot(4,2,7);
imshow(mat2gray(dollar_log));
subplot(4,2,8);
imhist(mat2gray(dollar_log),64);
