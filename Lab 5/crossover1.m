function crossed = crossover1(array1,array2)
crossed = [array1;array2];
gene = length(array1);
crossline = ceil(rand*gene-4); % the separation point
while crossline<1
    crossline = ceil(rand*gene-4);
end

% choose the right side of the separation point
crossarray(1,:) = array1(crossline+1:end-1); % choose the right side of the separation point
crossarray(2,:) = array2(crossline+1:end-1);
cross_size = length(crossarray); %length of the array
sequence = zeros(2,cross_size);

for i = 1:2
    crossarrayloop = crossarray(i,:);
    sequenceloop = sequence(i,:);
    for j = 1:cross_size
        % each value mark based on its value in ascending order
        % the marked value will show the sequence of the array
        minimum = min(crossarrayloop);
        min_index = find(crossarrayloop==minimum);
        sequenceloop(min_index) = j;
        crossarrayloop(min_index) = NaN;
    end
    sequence(i,:) = sequenceloop;
end

% the sequence of the array is swapped
cross_sequence = [sequence(2,:);sequence(1,:)];
crossing = zeros(1,cross_size);

for i=1:2
    sequenceloop = cross_sequence(i,:);
    crosslooparray = crossarray(i,:);
    for j= 1:cross_size
        %the array rearranged based on the swapped sequence
        crosslooparray = sort(crosslooparray);
        crossing(j) = crosslooparray(sequenceloop(j));
    end
    crossed(i,(crossline+1:end-1))=crossing;
end
end