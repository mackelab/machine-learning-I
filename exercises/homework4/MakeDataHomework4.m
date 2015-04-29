close all
clear all

rand('seed',0);
truetheta=1;
t=linspace(0,4,1001);

x=poissrnd(truetheta,1,100);

alpha=2;
beta=1;

y=gampdf(t,alpha,1/beta);
hold on

subplot(2,2,1)
plot(t,y);

%posterior parameters:
alphaN=alpha+sum(x);
betaN=beta+100;
y=gampdf(t,alphaN,1/betaN);

plot(t,y);
xlim([0,4]);

subplot(2,2,2)

for n=1:100
   alphan=alpha+sum(x(1:n));
   betan=beta+n;
   MLE(n)=mean(x(1:n));
   PostMean(n)=alphan/betan;
   PostVar(n)=alphan/betan^2;
end
plot(MLE,'r')
hold on
plot(PostMean);
legend('MLE','PostMean');

subplot(2,2,3)
plot(PostVar)




save Homework4 x alpha beta