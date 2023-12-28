function predictknn = knn(trainsplit,testsplit,trainsplitlabel,k)

for r=1:k
    mdlone = fitcknn(trainsplit,trainsplitlabel,'Distance','cityblock',...
        'NumNeighbors',r,'BreakTies','smallest');

    for tcase = 1:length(testsplit);
    predictknn(r,tcase) = predict(mdlone,testsplit(tcase,:));
    end

end
end