function modified = randNoise(a)

pix_no = 4;
modified = a;
a_size = size(a);

for i = 1:pix_no
    row_rand = randi(a_size(1));
    col_rand = randi(a_size(2));
    
    if modified(row_rand, col_rand) == 1
        modified(row_rand, col_rand) = 0;
    else
        modified(row_rand, col_rand) = 1;
    end
end

end