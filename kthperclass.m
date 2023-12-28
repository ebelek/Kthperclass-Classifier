function predclass = kthperclass(trainsplit,trainsplitlabel,testsplit,k)

% calculate the distance for each test data from each training data
for tcase = 1:length(testsplit)
    distvec1 = trainsplit - testsplit(tcase,:);
    dist{tcase} = abs(distvec1(:,1))+abs(distvec1(:,2));

end

% find the number of training datasets for each class
Nt = length(trainsplitlabel)/3;


for i=1:size(dist,2)
    % seperate test vector distances into classes 
    distvec = dist{1,i};
    setosa = distvec(1:Nt,:);
    versicolor = distvec(Nt+1:2*Nt,:);
    virginica = distvec(2*Nt+1:3*Nt,:);

    % sort test vector distances into classes in ascending order
    setosa_sorted = sort(setosa);
    versicolor_sorted = sort(versicolor);
    virginica_sorted = sort(virginica);

    %pick kth neighbour for each classes 
    setosa_dist = setosa_sorted(k,:);
    versicolor_dist = versicolor_sorted(k,:);
    virginica_dist = virginica_sorted(k,:);

    %predict the class for each test vector by finding the shortest
    %distance and by selecting lower index class in case of tie 
    if setosa_dist<=versicolor_dist && setosa_dist<=virginica_dist
        predclass(i) = 1;
    elseif versicolor_dist<=setosa_dist && versicolor_dist<=virginica_dist
        if versicolor_dist==setosa_dist
            predclass(i) =1;
        else
            predclass(i)=2;
        end
    elseif virginica_dist<=setosa_dist && virginica_dist<=versicolor_dist
        if virginica_dist==setosa_dist
            predclass(i)=1;
        elseif virginica_dist==versicolor_dist
            predclass(i)=2;
        else
            predclass(i)=3;
        end
    end
end


end





