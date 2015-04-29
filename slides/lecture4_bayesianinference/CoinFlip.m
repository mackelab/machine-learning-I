% a little matlab demo for demonstrating inference of the probability of a
% coin

%
clear all
close all
h=figure;
fs=13;
xgrid=linspace(0,1,501);

alphas=[1,2,8,.9,1,2,4,8]
betas=[1,2,8,.9,2,1,1,2]

for k=1:8
subplot(2,4,k)
plot(xgrid,betapdf(xgrid,alphas(k),betas(k)),'linewidth',2);
title(sprintf('(%g,%g)',alphas(k),betas(k)),'fontsize',fs)
set(gca,'fontsize',fs);
box off
end

PrintFigure(h(1),'pdf','BetaZoo',[],{'Papersize',[15,10]*1.5,'Paperposition',[0,0,15,10]*1.5})

%%
clear all
close all
h=figure;
fs=13;

xgrid=linspace(0,1,501);
rand('seed',5);
data=rand(1,9)<.666;

alphas=[2];
betas=[2];
alphas=[alphas,alphas+cumsum(data)];
betas=[betas,betas+(1:numel(data))-cumsum(data)];


for k=1:10
subplot(2,5,k)
plot(xgrid,betapdf(xgrid,alphas(k),betas(k)),'linewidth',2);
hold on
stem(mean(data(1:(k-1))),3,'linewidth',2,'color',1-[.2,.2,.2]);
if k>1
title(sprintf('T_%d= %d',k-1,data(k-1)),'fontsize',fs)
end
set(gca,'fontsize',fs);
box off
ylim([0,3.5]);
end

PrintFigure(h(1),'pdf','BetaPosterior',[],{'Papersize',[15,10]*1.5,'Paperposition',[0,0,15,10]*1.5})

%%
close all
h=figure;
bb=betapdf(xgrid,alphas(end),betas(end));
plot(xgrid,bb,'linewidth',2);
set(gca,'fontsize',fs);
box off
ylim([0,4.5]);
cdf=betacdf(xgrid,alphas(end), betas(end));
[junk,x1]=min(abs(cdf-.05))
c1=xgrid(x1);
[junk,x2]=min(abs(cdf-.95))
c2=xgrid(x2);

hold on
stem(c1,bb(x1),'linewidth',2);
stem(c2,bb(x2),'linewidth',2);
set(gca,'xtick',[0:.1:1]);

[c3,x3]=max(bb);
stem(xgrid(x3),c3,'linewidth',2,'linestyle','--','color','g');
c4=alphas(end)/(alphas(end)+betas(end));
[junk,x4]=min(abs(c4-xgrid));

stem(c4,bb(x4),'linewidth',2,'linestyle','--','color','k');
c5=mean(data);
stem(c5,4,'linewidth',2,'linestyle','--','color',1-[.2,.2,.2]);


tt=text(.61,1, '90%','fontsize',fs*3,'backgroundcolor','w','color','b');
tt=text(.75,3.5, 'Mode','fontsize',fs*2,'backgroundcolor','w','color','g');
tt=text(.55,3.5, 'Mean','fontsize',fs*2,'backgroundcolor','w','color','k');
tt=text(.85,4.1, 'MLE','fontsize',fs*2,'backgroundcolor','w','color',1-[.2,.2,.2]);



PrintFigure(h(1),'pdf','BetaPosteriorConfidence',[],{'Papersize',[15,10]*1.5,'Paperposition',[0,0,15,10]*1.5})


