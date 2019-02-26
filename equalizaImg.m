function [ proc_image, img_eq, img_eq_humps ] = equalizaImg( dimg_name )

% Background theory: https://flir.custhelp.com/ci/fattach/get/40007/0/filename/Histogram+equalization.pdf

proc_image = imread(dimg_name);
[h,w] = size(proc_image);

% Create the new image with the same size as original.
tp = h * w;
img_eq = zeros(h,w); 
hist = imhist(proc_image);
dimg = double(proc_image);

% Probability, ak(acumulative prob) & enhacement (equalization)
p = zeros (1,256);
ak = zeros(1,256);
enhacement = zeros(1,256);

% First, check the probability of any value given the matrix of the image.
for k=1:256
    p(k)=hist(k)/tp;
end

ak(1) = p(1); % Always 0 for acumulative, none value before

% Then, (L-1) procedure 
for k = 2:256
    ak(k) = ak(k-1) + p(k);
end

% Enhacement will appear as a gray transform
for k=1:256
    enhacement(k) = ak(k)*256;
end

%Sustitucion de los niveles de gris en base a enhacement
for i=1:h
    for j=1:w
        k = dimg(i,j);
        img_eq(i,j)=enhacement(k+1);
    end
end

% With included func 'humps'
img_humps = uint8(proc_image);
humps_range = humps(0:1/256:2);
img_eq_humps = histeq(img_humps, humps_range);  

end

