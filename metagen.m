function md = metagen(setname,species)
%------------------------------------------%
% date: june 2023
% pgmmer: GEB
% purpose: generate meta data for dataset 
% assumes data ordered in chunks by class
% inputs:
%   setname  string giving name of dataset, e.g. "iris"
%   species  Nx1 class names corresponding to feature data
%            (used to get class names for plotting)
% outputs:
%   md       structure containing meta-data (see below)
% note: like iris dataset, assumes same number vectors per class
%------------------------------------------%

switch setname
    case "fisheriris"
        md.setname = setname;
        md.nclass = 3;
        md.nfeature = 4;
        md.vecsperclass = 50;
        md.fname{1} = "sepal length [cm]";
        md.fname{2} = "sepal width [cm]";
        md.fname{3} = "petal length [cm]";
        md.fname{4} = "petal width [cm]";
        md.fstartlist = [4 2 1 0]; %lowest feature value for axis cmd
        md.fstoplist = [8 5 7 3];  %highest feature value for axis cmd
        md.mlist{1} = 'k^'; % plot marker indexed by class
        md.mlist{2} = 'bx'; % plot marker indexed by class
        md.mlist{3} = 'rs'; % plot marker indexed by class
        md.labels{1} = 'setosa';
        md.labels{2} = 'versicolor';
        md.labels{3} = 'virginica';
    case "irisf34"
        md.setname = setname;
        md.nclass = 3;
        md.nfeature = 2;
        md.vecsperclass = 50;
        md.fname{1} = "petal length [cm]";
        md.fname{2} = "petal width [cm]";
        md.fstartlist = [1 0]; %lowest feature value for axis cmd
        md.fstoplist = [7 3];  %highest feature value for axis cmd
        md.mlist{1} = 'k^'; % plot marker indexed by class
        md.mlist{2} = 'bx'; % plot marker indexed by class
        md.mlist{3} = 'rs'; % plot marker indexed by class
        md.labels{1} = 'setosa';
        md.labels{2} = 'versicolor';
        md.labels{3} = 'virginica';
    case "testdata"
        md.setname = setname;
        md.nclass = 2;
        md.nfeature = 2;
        md.vecsperclass = 2;
        md.fname{1} = "feat1";
        md.fname{2} = "feat2";
        md.fstartlist = [-3 -3]; %lowest feature value for axis cmd
        md.fstoplist = [3 3];  %highest feature value for axis cmd
        md.mlist{1} = 'k^'; % plot marker indexed by class
        md.mlist{2} = 'bx'; % plot marker indexed by class
   otherwise
        error("setname not supported")
end

for class = 1:md.nclass
    index = 1 + (class-1)*md.vecsperclass;
    md.labels{class} = species{index};
end

end