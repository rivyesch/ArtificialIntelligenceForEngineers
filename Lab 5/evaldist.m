function totaldist=evaldist(chromosome,city_distance,chrom,gene)
totaldist=[];
for k=1:chrom
    path=0;
    for i=1:gene
        path = path + city_distance(chromosome(k,i),chromosome(k,(i+1)));
    end
    totaldist(k)=path;
end
