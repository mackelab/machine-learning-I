%% make toy data for linear regression problem. 
% The 'true' model of the data is 


clear all, close all
randn('seed',0);

NTrain=200;
NTest=200;
NValidation=1000;
omega_true=[2, 1,0,0,0,-.5,0,0,2,0,3,0,0,0,0,0,0],
M=numel(omega_true);

lambdas=[1,5,10,25,50,75,100,250,500,750,1000]
xTrain=randn(NTrain,M-1);
xTest=randn(NTest,M-1);
xValidation=randn(NValidation,M-1);



xTrain=[ones(NTrain,1), xTrain];
xTest=[ones(NTest,1), xTest];
xValidation=[ones(NValidation,1), xValidation];


yTrain=xTrain*omega_true'+ randn(NTrain,1)*10;
yTest=xTest*omega_true'+ randn(NTest,1)*10;
yValidation=xValidation*omega_true'+ randn(NValidation,1)*10;


save Homework1 x* yT* M lambdas N*

xxtop=xTrain'*xTrain;
xtopy=xTrain'*yTrain;

xxtop+eye(size(xxtop))*2;

omega_o= xxtop\xtopy;


%%
h=figure(1);
subplot(2,2,1)
plot(omega_o); hold on; plot(omega_true,'r');
xlabel('Dimension'); ylabel('Weight'); legend('estimated weights', 'true weights');


for k=1:numel(lambdas);
    omega(k,:)=(xxtop+lambdas(k)*eye(size(xxtop)))\xtopy;
    ypredTrain=(omega(k,:)*xTrain')';
    ypredTest=(omega(k,:)*xTest')';
    ypredValidation=(omega(k,:)*xValidation')';
    errorTrain(k)=mean((ypredTrain-yTrain).^2)';
    errorTest(k)=mean((ypredTest-yTest).^2)';
    errorValidation(k)=mean((ypredValidation-yValidation).^2)';
end
subplot(2,2,2)
semilogx(lambdas,errorTrain);
hold on
semilogy(lambdas,errorTest,'r');
semilogy(lambdas,errorValidation,'g');
xlabel('lambda'); ylabel('MSE'); legend('Train','Test','Validation','location','southeast');

[bestMSE,bestlambdaindex]=min(errorTest);

best_omega=omega(bestlambdaindex,:);
best_lambda=lambdas(bestlambdaindex);

subplot(2,2,3);
plot(best_omega); hold on; plot(omega_true,'r');
xlabel('Dimension'); ylabel('Weight'); legend('best weights','true weights');




