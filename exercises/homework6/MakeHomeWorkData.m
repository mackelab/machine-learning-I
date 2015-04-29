%generate data for binary classification
close all
clear all
randn('seed',0);
rand('seed',0);

covo=(eye(2)-.3*ones(2))*(5);
covo(1)=covo(1)*2;


G=chol(covo);

N=500;

xTrain=randn(N,2)*G;

xTest=randn(N,2)*G;

tTrain=ones(N,1);
tTrain(1:N/2)=-1;
tTrain=tTrain(randperm(N));

tTest=ones(N,1);
tTest(1:N/2)=-1;
tTest=tTest(randperm(N));

xTrain=xTrain+repmat(tTrain,1,2);
xTest=xTest+repmat(tTest,1,2);

%do mle estimation of moments:
m_p=mean(xTrain(tTrain==1,:));
m_m=mean(xTrain(tTrain==-1,:));
cov_p=cov(xTrain(tTrain==1,:));
cov_m=cov(xTrain(tTrain==-1,:));
cov_est=0.5*cov_p+0.5*cov_m;

omega=cov_est\(m_p-m_m)';

omega_o=-0.5*m_p *cov_p^(-1) *m_p'+.5*m_m *cov_m^(-1) *m_m';

%equation of line: omega(1)x+omega(2)y+omega_o=0
% y=-omega_o

xplot=-5:5;
yplot=(-omega_o-omega(1)*xplot)/omega(2);


%plot stuff
plot(xTest(tTest==1,1),xTest(tTest==1,2),'.');
hold on
plot(xTest(tTest==-1,1),xTest(tTest==-1,2),'r.');

hold on
plot(xplot,yplot,'k')


%calculate test and training error
decisions_linear_train=sign(xTrain*omega+omega_o);
error_rate_linear_train=mean(decisions_linear_train~=tTrain)

decisions_linear_test=sign(xTest*omega+omega_o);
error_rate_linear_test=mean(decisions_linear_test~=tTest)

decisions_quad_train=sign(diag(xTrain*0.5*(cov_m^(-1)-cov_p^(-1))*xTrain')+xTrain*omega+omega_o);
error_rate_quad_train=mean(decisions_quad_train~=tTrain)

decisions_quad_test=sign(diag(xTest*0.5*(cov_m^(-1)-cov_p^(-1))*xTest')+xTest*omega+omega_o);
error_rate_quad_test=mean(decisions_quad_test~=tTest)

save HomeWork6 *Train *Test
