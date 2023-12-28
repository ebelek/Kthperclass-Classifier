function predclass = kthclass(mindist,k)


for i=1:size(mindist,2)
    distvec = mindist{1,i};

    %separate distance of training data into classes
    setosa = distvec(1:50,:);
    versicolor = distvec(51:100,:);
    virginica = distvec(101:150,:);
    
    %sort the distance of the training data in acsending order 
    setosa_sorted = sort(setosa);
    versicolor_sorted = sort(versicolor);
    virginica_sorted = sort(virginica);
    
    % pick desired kth class distance for each class  
    setosa_dist = setosa_sorted(k,:);
    versicolor_dist = versicolor_sorted(k,:);
    virginica_dist = virginica_sorted(k,:);

    %determine the lowest distance as well as solve the tie cases 
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
    



