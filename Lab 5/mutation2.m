%shift a random section to the right by one
%last number of that section move to the front of the section

function mutated = mutation2(array)
mutate = array(2:end-1); %prevent changing start point and end point

% front of the random section
point1 = ceil(rand*length(mutate)-1); 
if point1<1
point1=1;
end

% back of the random section
point2 = ceil(rand*length(mutate)); 

while point2<=point1
point2 = ceil(rand*length(mutate));
end

mutating = mutate(point1:point2); % extract the random section from the array 
mutating = [mutating(end) mutating(1:end-1)]; % shift the section to the right by one
mutated = [array(1) mutate(1:point1-1) mutating mutate(point2+1:end) array(end)];
end