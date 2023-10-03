% sequence swapping to the middle
function crossed = crossover3(array1,array2)
crossed = [array1;array2];
gene = length(array1);
point1 = ceil(rand*gene-4); % the separation point1

while point1<3
    point1 = ceil(rand*gene-4);
end

point2 = ceil(rand*gene-2); % the separation point2

while point2<point1+2 || point2>gene
    point2 = ceil(rand*gene-2);
end

% choose the right side of the separation point
crossarray(1,:) = array1(point1:point2); % choose the array between the two separation points
crossarray(2,:) = array2(point1:point2);
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
    crossed(i,(point1:point2))=crossing;
end
end