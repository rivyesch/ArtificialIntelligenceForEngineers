function [ im_noise ] = AddNoise( im_in,noiselvl )
% Written by: xxxx
% Last Modified: 01/11/2017
%AddNoise is a function designed to generate noisy versions of images by
%inverting bits randomly based on noiselevel required
% Input Arguments: im_in = Input Image/Array
%                : noiselvl = Amount of bits required to be inverted
% Output Arguments: im_noise = Image with Noise
x = noiselvl;
[r,c] = size(im_in);
% Value to choose random number from (Lower boundary)
a1 = round(r/5);
a2 = round(c/5);

for i=1:x
    r_rand = round((r-a1)*rand(1)+1);
    c_rand = round((c-a2)*rand(1)+1);
    im_in(r_rand,c_rand) = ~(im_in(r_rand,c_rand));
    im_noise = im_in;
end
    


end

