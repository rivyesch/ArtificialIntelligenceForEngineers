%swap between two random point
function mutated = mutation1(array)
mutate = array(2:end-1); %prevent changing start point and end point 
mutateref = mutate;
point1 = ceil(rand*length(mutate)); 
point2 = ceil(rand*length(mutate));

if point1 == point2
    point2 = ceil(rand*length(mutate));
end

%swap between two random point 
mutate(point1) = mutateref(point2); 
mutate(point2) = mutateref(point1); 
mutated = [array(1) mutate array(end)]; 
end