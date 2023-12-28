function [cmat,corder,Pe,Pebyclass] = performance(truespecies,predspecies,plotflag)
%-------------------------------------------%
% date:   july 2023
% pgmmer:  GEB
% purpose: evaluate classifier performance
% inputs:
%   truespecies  Nx1 cell array of true class labels
%   predspecies  Nx1 cell array of predicted class labels
%   plotflag     nonzero implies call to confusionchart to plot 
%                confusion matrix (need R2018b or later)
% outputs:
%   cmat    nclass x nclass confusion matrix, row per true class, col per pred class
%   corder  nclass x 1 vector giving order of classes in cmat 
%   Pe      overall probability of classification error
%   Pebyclass  nclass x 1 conditional (by class) probability of 
%              classification error, order according to corder
%   <onscreen plot of cmat if plotflag set nonzero>
%-------------------------------------------%

if plotflag
    figure(1)
    confusionchart(truespecies,predspecies) %need R2018b or later
    title('confusion matrix for test_knn')
end

ntest = max(size(truespecies));
[cmat,corder] = confusionmat(truespecies,predspecies);
nerror = sum(sum(cmat)) - sum(diag(cmat));
Pe = nerror/ntest;
nbyclass = sum(cmat,2);
ebyclass = nbyclass - diag(cmat);
Pebyclass = ebyclass./nbyclass;

end

