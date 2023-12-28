% Ermek Belekov; Software Project
%------------------------------------------%
clear all; close all; clc



qfopt = 10;

setname = 'irisf34'
load(setname);
md = metagen(setname,species);  %generate meta data

% quantize or not features
if qfopt == 0
    measqf = meas;
else
    measqf = round(qfopt*meas);
end

load('iristestvectors.mat');
% set up test vectors, true labels, and commments
ntest = 7;
for i = 1:ntest
 tvecs(i,:) = meastest(i,:);
 tspecies{i,1} = speciestest{i,1};
end 

testvec = round(10*tvecs);
trainvec = measqf;

mindist = dist(trainvec,testvec);

k=1;
predspecies = kthclass(mindist,k)

plotflag = 1;
truespecies = [1 2 3 3 3 2 3];
[cmat,corder,Pe,Pebyclass] = performance(truespecies,predspecies,plotflag)







