%nonlinear regression in matlab
close all
clear all
randn('seed',1);
rand('seed',2);

beta=1;
alpha=1;
xTrain=[sort(rand(20,1))*50];
xPlot=linspace(1,50,501)';
N=numel(xTrain);
NPlot=numel(xPlot);

yofxTrue=@(x)(100*(.01*x.^2.*exp(-x/6)+.05*sin(x/pi)));
yTrue=yofxTrue(xPlot);
tTrain=yofxTrue(xTrain)+randn(size(xTrain));


%make basis functions

zofx=@(x)(2*exp(-(repmat(x,1,50)-repmat([1:50],numel(x),1)).^2/25));

zTrain=zofx(xTrain);


%xxtop=xTrain'*xTrain;
%xtopy=xTrain'*yTrain;

%w=(xxtop+alpha/beta*eye(size(xxtop)))\xtopy;

SN=inv(eye(50)*alpha+beta*zTrain'*zTrain);
mupost=SN*beta*(zTrain'*tTrain);
B=zofx(xPlot);
mupred=B*mupost;
SNpred=B*SN*B'+eye(numel(xPlot))*1/beta;

stdpost=sqrt(diag(SN));
stdpred=sqrt(diag(SNpred));

subplot(2,3,1)
plot(xPlot,B);

subplot(2,3,2)
imagesc(zTrain)

subplot(2,3,3)
plot(xPlot,yTrue);
hold on
plot(xTrain,tTrain,'.')


subplot(2,3,4)
plot(mupost)
hold on
plot(mupost+2*stdpost,'--')
plot(mupost-2*stdpost,'--')



subplot(2,3,5)
plot(xPlot,mupred,'r')
hold on
plot(xPlot,yTrue);
plot(xTrain,tTrain,'.')
plot(xPlot,mupred-2*stdpred,'r--')
plot(xPlot,mupred+2*stdpred,'r--')



subplot(2,3,6)
imagesc(SN)



save HomeWork5 xTrain tTrain xPlot 
