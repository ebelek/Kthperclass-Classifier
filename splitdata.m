function [trainsplit,testsplit,trainsplitlabel,testsplitTruelabel] = splitdata(measqf,Nt)
    % split train data for each class, allocate first Nt datapoints from
    % each class
    trainsplit = [measqf(1:Nt,:); measqf(51:Nt+50,:); measqf(101:Nt+100,:)];
    
    % label each train values  
    trainsplitlabel = zeros(Nt*3,1);
    trainsplitlabel(1:Nt) = 1;
    trainsplitlabel(Nt+1:2*Nt) = 2;
    trainsplitlabel(2*Nt+1:3*Nt) = 3;

    % split test data for each class, allocate first 50-Nt datapoints from
    % each class
    testsplit = [measqf(Nt+1:50,:); measqf(51+Nt:100,:); measqf(101+Nt:150,:)];

    testsplitTruelabel =zeros((50-Nt)*3,1);
    testsplitTruelabel(1:(50-Nt)) = 1;
    testsplitTruelabel((51-Nt):2*(50-Nt)) = 2;
    testsplitTruelabel(2*(50-Nt)+1:3*(50-Nt)) = 3;

end