% =========================================================================
% Genetic Algorithm
% =========================================================================

clc; clear; close all;

% read the data from excel
citydata = xlsread('Data Set for GA Assignment/pr144.csv');
citydata = citydata(1:50,:); % take only the first 50 data
x = citydata(:,1); % X coordinate
y = citydata(:,2); % Y coordinate

% number of cities to be visited by the salesman
num = 50;

% show the plot of the city location
figure;hold on;
plot(x,y,'.r','markersize',25)

% Assign a numerical name for each city
for i = 1:num;
    text(x(i)+0.02,y(i),sprintf('%g',i));
end

% plot all available roads between cities
for i = 1:num
    for j = 1:num
        plot([x(i) x(j)],[y(i) y(j)])
    end
end
title('All Possible Route');
xlabel("X coordinate")
ylabel("Y coordinate")

% finding distance between cities
citydist = dist(citydata');
%%
% setting GA parameters
chrom = 500; % number of different combination(chromosomes)
gene = num; % number of cities(gene)
PC = 0.5; % probability of crossover
PM = 0.09; % probability of mutation
generation = 2000; % number of generation

disp('')
disp('GA parameters')
disp('==================================')
fprintf(1,' chrom = %.0f Size of the chromosome population\n',chrom);
fprintf(1,' Pc = %.1f Crossover probability\n',PC);
fprintf(1,' Pm = %.3f Mutation probability\n',PM);
fprintf(1,' generation = %.0f Number of generations\n',generation);
disp(' ')

iterations = 1;
totaltime = 0;
bestarray = zeros(1,iterations);
for p=1:iterations
    % Generate population of chromosomes
    chromgen=[];
    
    for k=1:chrom
        num=gene;
        city_array=1:num;
        xxx=[];
        for n=1:num
            a=rand(1);
            for i=1:num
                if a<i/num
                    xxx=[xxx city_array(i)];
                    break
                end
            end
            city_array(i)=[];
            num=num-1;
        end
        chromgen(k,:)=xxx;
    end
    
    chromgen;
    rout=[chromgen chromgen(:,1)];
    
    % Calculate the chromosome fitness
    totaldist = evaldist(rout,citydist,chrom,gene);
    best = min(totaldist);
    
    % Plot the best route found in the initial chromosome population
    [a b] = min(totaldist);
    figure('name','The best rout found in the initial population');
    plot(x,y,'.r','markersize',25)
    title(['The total distance: ',num2str(a)]);
    hold on
    
    for i = 1:gene;
        text(x(i)+0.02,y(i),sprintf('%g',i));
        plot([x(rout(b,i)) x(rout(b,(i+1)))],[y(rout(b,i)) y(rout(b,(i+1)))]);
    end
    
    %=========================================================================
    % RUN GENETIC ALGORITHM
    %=========================================================================
    
    tic;
    for m = 1:(generation)
        
        %=========================================================================
        % Selection
        %=========================================================================
        
        fitness = (1./totaldist)';
        relativefitness = (fitness./sum(fitness))*100;
        cumfit=cumsum(fitness);
        
        % Roulette wheel selection
        numsel=round(chrom); % The number of chromosomes to be selected for reproduction
        cumfit=repmat(cumsum(fitness),1,numsel); % Replicating the cumulative fitness array
        chance=repmat(rand(1,numsel),chrom,1)*cumfit(chrom,1);
        [selind,j]=find(chance < cumfit & chance >= [zeros(1,numsel);cumfit(1:chrom-1,:)]);
        selected=(rout(selind,:));
        
        %=========================================================================
        % CrossOver
        %=========================================================================
        
        crossed = selected;
        for n = 1:2:chrom
            if (rand<PC)
                crossed(n:n+1,:) = crossover1(selected(n,:),selected(n+1,:));
            else
            end
        end
        
        %=========================================================================
        % Mutation
        %=========================================================================
        
        mutated = crossed;
        for n = 1:chrom
            if (rand<PM)
                mutated(n,:) = mutation1(crossed(n,:));
            else
            end
        end
        rout = mutated;
        
        %calculate total distance
        totaldist = evaldist(rout,citydist,chrom,gene);
        best = [best min(totaldist)];
    end
    [a b] = min(totaldist);
    Best_Fitness_Value = 1/a
    mindist = a;
    
    
    
    % Plotting the best rout found in the current population
    figure('name','The best route found in the current population');
    plot(x,y,'.r','markersize',25)
    title(['Generation # ',num2str(generation),' The total distance:',num2str(a)]);
    hold on
    
    for i=1:gene;
        text(x(i)+0.02,y(i),sprintf('%g',i));
        plot([x(rout(b,i)) x(rout(b,(i+1)))],[y(rout(b,i)) y(rout(b,(i+1)))])
    end
    timetaken = toc;
    
    bestarray(p) = a;
    totaltime = totaltime + timetaken;
end

bestDist = min(bestarray)
averageDist = sum(bestarray)/iterations
averageTime = totaltime/iterations
%=========================================================================
% Performance Graph
%=========================================================================

disp(' ')
figure('name','Performance graph');
plot(0:generation,best);
legend('Best','Location','Best');
title(['Pc = ',num2str(PC),', Pm = ',num2str(PM)]);
xlabel('Generations');
ylabel('Distance')