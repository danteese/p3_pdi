%% Practica 3 

clear all, clc;

%% Seccion 1

% Lectura de imagenes
m1 = imread('museum1.jpeg');
m2 = imread('museum2.jpeg');
m3 = imread('museum3.jpeg');
tank = imread('tank.tif');
pens = imread('pens.tif');
clown = imread('clown.tif');
dollar = imread('dollar.tif');
files = {'museum1.jpeg','museum2.jpeg','museum3.jpeg'};

%Conversion a HDR

disp('Conversi?n de imagen a HDR')
expTimes = [0.1000, 0.6250, 4.0000];
hdr = makehdr(files,'RelativeExposure',expTimes./expTimes(1));
imshow(hdr);
title('HDR')
set(gcf, 'Name', 'Imagen en HDR', 'NumberTitle', 'Off');

%conversion a RGB

disp('Conversi?n de imagen HDR a RGB')
rgb = tonemap(hdr);
figure
imshow(rgb);
title('RGB')
set(gcf, 'Name', 'Imagen de HDR a RGB', 'NumberTitle', 'Off');


%de rgb a grises
m1g = rgb2gray(m1);
m2g = rgb2gray(m2);
m3g = rgb2gray(m3);

%historgrama museo
disp('Histograma de imagenes del museo')
figure
set(gcf, 'Name', 'Histograma de museo en grises', 'NumberTitle', 'Off');
subplot(3,2,1),imshow(m1g),title('Imagen de museo en gris 1');
subplot(3,2,2),imhist(m1g,64),title('Histograma de museo 1');
subplot(3,2,3),imshow(m2g),title('Imagen de museo en gris 2');
subplot(3,2,4),imhist(m2g,64),title('Histograma de museo 2');
subplot(3,2,5),imshow(m3g),title('Imagen de museo en gris 3');
subplot(3,2,6),imhist(m3g,64),title('Histograma de museo 3');

%histograma .tif
disp('Histograma de imagenes .tif')
figure
set(gcf, 'Name', 'Histograma de imagenes .tif', 'NumberTitle', 'Off');
subplot(4,2,1),imshow(tank),title('Imagen original');
subplot(4,2,2),imhist(tank,64),title('Histograma');
subplot(4,2,3),imshow(pens),title('Imagen original');
subplot(4,2,4),imhist(pens,64),title('Histograma');
subplot(4,2,5),imshow(clown),title('Imagen original');
subplot(4,2,6),imhist(clown,64),title('Histograma');
subplot(4,2,7),imshow(dollar),title('Imagen original');
subplot(4,2,8),imhist(dollar,64),title('Histograma');

%Negativos museo
m1_neg = imadjust(m1g, [0 1], [1 0]);
m2_neg = imadjust(m2g, [0 1], [1 0]);
m3_neg = imadjust(m3g, [0 1], [1 0]);
disp('Negativos de museo')
figure
set(gcf, 'Name', 'Negativos de museo', 'NumberTitle', 'Off');
subplot(3,2,1),imshow(m1_neg),title('Imagen en negativo museo 1');
subplot(3,2,2),imhist(m1_neg,64),title('Histograma del negativo museo 1');
subplot(3,2,3),imshow(m2_neg),title('Imagen en negativo museo 2');
subplot(3,2,4),imhist(m2_neg,64),title('Histograma del negativo museo 2');
subplot(3,2,5),imshow(m3_neg),title('Imagen en negativo museo 3');
subplot(3,2,6),imhist(m3_neg,64),title('Histograma del negativo museo 3');

%Negativos
tank_neg = imadjust(tank, [0 1], [1 0]);
pens_neg = imadjust(pens, [0 1], [1 0]);
clown_neg = imadjust(clown, [0 1], [1 0]);
dollar_neg = imadjust(dollar, [0 1], [1 0]);
disp('Negativos')
figure
set(gcf, 'Name', 'Negativos', 'NumberTitle', 'Off');
subplot(4,2,1),imshow(tank_neg),title('Imagen en negativo');
subplot(4,2,2),imhist(tank_neg,64),title('Histograma de imagen en negativo');
subplot(4,2,3),imshow(pens_neg),title('Imagen en negativo');
subplot(4,2,4),imhist(pens_neg,64),title('Histograma de imagen en negativo');
subplot(4,2,5),imshow(clown_neg),title('Imagen en negativo');
subplot(4,2,6),imhist(clown_neg,64),title('Histograma de imagen en negativo');
subplot(4,2,7),imshow(dollar_neg),title('Imagen en negativo');
subplot(4,2,8),imhist(dollar_neg,64),title('Histograma de imagen en negativo');

%Ecualizaci?n de histograma museo
m1_eq = histeq(m1g);
m2_eq = histeq(m2g);
m3_eq = histeq(m3g);
disp('Ecualizaci?n de histograma museo')
figure
set(gcf, 'Name', 'Ecualizacion de histograma museo', 'NumberTitle', 'Off');
subplot(3,2,1),imshow(m1_eq),title('Imagen equalizada de museo 1');
subplot(3,2,2),imhist(m1_eq,64),title('Histograma equalizado de museo 1');
subplot(3,2,3),imshow(m2_eq),title('Imagen equalizada de museo 2');
subplot(3,2,4),imhist(m2_eq,64),title('Histograma equalizado de museo 2');
subplot(3,2,5),imshow(m3_eq),title('Imagen equalizada de museo 3');
subplot(3,2,6),imhist(m3_eq,64),title('Histograma equalizado de museo 3');

%Ecualizacion de histograma
tank_eq = histeq(tank);
pens_eq = histeq(pens);
clown_eq = histeq(clown);
dollar_eq = histeq(dollar);
disp('Ecualizaci?n de histograma')
figure
set(gcf, 'Name', 'Ecualizacion de histograma', 'NumberTitle', 'Off');
subplot(4,2,1),imshow(tank_eq),title('Imagen equalizada');
subplot(4,2,2),imhist(tank_eq,64),title('Histograma equalizado');
subplot(4,2,3),imshow(pens_eq),title('Imagen equalizada');
subplot(4,2,4),imhist(pens_eq,64),title('Histograma equalizado');
subplot(4,2,5),imshow(clown_eq),title('Imagen equalizada');
subplot(4,2,6),imhist(clown_eq,64),title('Histograma equalizado');
subplot(4,2,7),imshow(dollar_eq),title('Imagen equalizada');
subplot(4,2,8),imhist(dollar_eq,64),title('Histograma equalizado');

%Funcion logaritmica museo
m1_log = uint8(log(double(m1g)+1) .* ((255 - 1)/log(255)));
m2_log = uint8(log(double(m2g)+1) .* ((255 - 1)/log(255)));
m3_log = uint8(log(double(m3g)+1) .* ((255 - 1)/log(255)));
disp('Funci?n logaritmica museo')
figure
set(gcf, 'Name', 'Funcion logaritmica museo', 'NumberTitle', 'Off');
subplot(3,2,1),imshow(mat2gray(m1_log)),title('Imagen logaritmica museo 1');
subplot(3,2,2),imhist(mat2gray(m1_log),64),title('Histograma logaritmico museo 1');
subplot(3,2,3),imshow(mat2gray(m2_log)),title('Imagen logaritmica museo 2');
subplot(3,2,4),imhist(mat2gray(m2_log),64),title('Histograma logaritmico museo 2');
subplot(3,2,5),imshow(mat2gray(m3_log)),title('Imagen logaritmica museo 3');
subplot(3,2,6),imhist(mat2gray(m3_log),64),title('Histograma logaritmico museo 3');

%Funcion logaritmica
tank_log = uint8(log(double(tank)+1) .* ((255 - 1)/log(255)));
pens_log = uint8(log(double(pens)+1) .* ((255 - 1)/log(255)));
clown_log = uint8(log(double(clown)+1) .* ((255 - 1)/log(255)));
dollar_log = uint8(log(double(dollar)+1) .* ((255 - 1)/log(255)));
disp('Funci?n logaritmica')
figure
set(gcf, 'Name', 'Funcion logaritmica', 'NumberTitle', 'Off');
subplot(4,2,1),imshow(mat2gray(tank_log)),title('Imagen logaritmica');
subplot(4,2,2),imhist(mat2gray(tank_log),64),title('Histograma logaritmico');
subplot(4,2,3),imshow(mat2gray(pens_log)),title('Imagen logaritmica');
subplot(4,2,4),imhist(mat2gray(pens_log),64),title('Histograma logaritmico');
subplot(4,2,5),imshow(mat2gray(clown_log)),title('Imagen logaritmica');
subplot(4,2,6),imhist(mat2gray(clown_log),64),title('Histograma logaritmico');
subplot(4,2,7),imshow(mat2gray(dollar_log)),title('Imagen logaritmica');
subplot(4,2,8),imhist(mat2gray(dollar_log),64),title('Histograma logaritmico');

%Funcion exponencial museo
m1_log = uint8((exp(double(m1g)) .^ (log(256) / (256-1))) - 1);
m2_log = uint8((exp(double(m2g)) .^ (log(256) / (256-1))) - 1);
m3_log = uint8((exp(double(m3g)) .^ (log(256) / (256-1))) - 1);
disp('Funci?n exponencial museo')
figure;
set(gcf, 'Name', 'Funcion exponencial museo', 'NumberTitle', 'Off');
subplot(3,2,1),imshow(mat2gray(m1_log)),title('Imagen exponencial museo 1');
subplot(3,2,2),imhist(mat2gray(m1_log),64),title('Histograma exponencial museo 1');
subplot(3,2,3),imshow(mat2gray(m2_log)),title('Imagen exponencial museo 2');
subplot(3,2,4),imhist(mat2gray(m2_log),64),title('Histograma exponencial museo 2');
subplot(3,2,5),imshow(mat2gray(m3_log)),title('Imagen exponencial museo 3');
subplot(3,2,6),imhist(mat2gray(m3_log),64),title('Histograma exponencial museo 3');

%Funcion exponencial
tank_exp = uint8((exp(double(tank)) .^ (log(256) / (256-1))) - 1);
pens_log = uint8((exp(double(pens)) .^ (log(256) / (256-1))) - 1);
clown_log = uint8((exp(double(clown)) .^ (log(256) / (256-1))) - 1);
dollar_log = uint8((exp(double(dollar)) .^ (log(256) / (256-1))) - 1);
disp('Funci?n exponencial museo')
figure
set(gcf, 'Name', 'Funcion exponencial', 'NumberTitle', 'Off');
subplot(4,2,1),imshow(mat2gray(tank_exp)),title('Imagen exponencial');
subplot(4,2,2),imhist(mat2gray(tank_exp),64),title('Histograma exponencial');
subplot(4,2,3),imshow(mat2gray(pens_log)),title('Imagen exponencial');
subplot(4,2,4),imhist(mat2gray(pens_log),64),title('Histograma exponencial');
subplot(4,2,5),imshow(mat2gray(clown_log)),title('Imagen exponencial');
subplot(4,2,6),imhist(mat2gray(clown_log),64),title('Histograma exponencial');
subplot(4,2,7),imshow(mat2gray(dollar_log)),title('Imagen exponencial');
subplot(4,2,8),imhist(mat2gray(dollar_log),64),title('Histograma exponencial');


%% Seccion 2
clc;
disp('Parte 2: Mejora de histograma. Procesamiento de aircraft y Lenna')

% Airfield
[airfield, airfield_flat, airfield_humps] = equalizaImg('airfield2.tif');
figure('Name', 'airfield2.tif', 'NumberTitle', 'off');
img = uint8(airfield);
img_eq = uint8(airfield_flat);
subplot(2,2,1), imshow(img,[],'InitialMagnification', 'fit'), title('Original');
subplot(2,2,2), imhist(img), title('Histograma original');
subplot(2,2,3), imshow(img_eq), title('Imagen Equalizada');
subplot(2,2,4), imhist(img_eq), title('Histograma img equalizada');

figure('Name', 'airfield2.tif humps', 'NumberTitle', 'off');
subplot(2,2,1), imshow(img, [],'InitialMagnification', 'fit'), title('Original');
subplot(2,2,2), imhist(img), title('Histograma original');
subplot(2,2,3), imshow(airfield_humps), title('Imagen Equalizada (humps)');
subplot(2,2,4), imhist(airfield_humps), title('Histograma img equalizada (humps)');

% Lenna
[lenna, lenna_flat, lenna_humps] = equalizaImg('lenna.tif');
figure('Name', 'lenna.tif', 'NumberTitle', 'off');
img = uint8(lenna);
img_eq = uint8(lenna_flat);
subplot(2,2,1), imshow(img,[],'InitialMagnification', 'fit'), title('Original');
subplot(2,2,2), imhist(img), title('Histograma original');
subplot(2,2,3), imshow(img_eq), title('Imagen Equalizada');
subplot(2,2,4), imhist(img_eq), title('Histograma img equalizada');

figure('Name', 'lenna.tif humps', 'NumberTitle', 'off');
subplot(2,2,1), imshow(img, [],'InitialMagnification', 'fit'), title('Original');
subplot(2,2,2), imhist(img), title('Histograma original');
subplot(2,2,3), imshow(lenna_humps), title('Imagen Equalizada (humps)');
subplot(2,2,4), imhist(lenna_humps), title('Histograma img equalizada (humps)');

%% Seccion 3
clc;

disp('Esteganograf?a: Cuartel general.')
painting = imread ('paisaje_Morfin.tif');

% Get channels
R = double(painting(:,:,1));
G = double(painting(:,:,2));
B = double(painting(:,:,3));

% Get map from each plane
map_6 = bitget(R,2)*64; map_5 = bitget(R,1)*32; map_4 = bitget(G,2)*16;
map_3 = bitget(G,1)*8; map_2 = bitget(B,2)*4; map_1 = bitget(B,1)*2;
% If the plane is not multiplied by the factor the result is noise.


hidden = map_6 + map_5 + map_4 + map_3 + map_2 + map_1;
figure;
imshow(painting, [],'InitialMagnification', 'fit'), title('Original');
figure('Name', 'Mensaje oculto [SECRETO]', 'NumberTitle', 'off');
imshow(hidden,[]);
