clear all
close all
randn('seed',0);

x=[1:.5:10];
N=numel(x);
x2=[1:20];
N2=numel(x2);

a=0.5;
alpha=1;
beta=1;

ymean=a*x;


y=ymean+randn(size(ymean))/beta;

ymeanlong=a*x2;

h(1)=figure;
errorshading(x2,ymeanlong-2*beta,ymeanlong+2*beta)
hold on
plot(x2,ymeanlong,'linewidth',2)

box off

plot(x,y,'.','markersize',15)
ylim([0,15]);
xlim([0,20]);
set(gca,'fontsize',15)


h(2)=figure;
errorshading(x2,.8*ymeanlong-2*beta,1.2*ymeanlong+2*beta)
hold on

plot(x2,ymeanlong,'linewidth',2)
plot(x2,ymeanlong*1.05,'--','linewidth',1)
plot(x2,ymeanlong*1.1,'--','linewidth',1)
plot(x2,ymeanlong*.9,'--','linewidth',1)
plot(x2,ymeanlong*.95,'--','linewidth',1)




box off

plot(x,y,'.','markersize',15)
ylim([0,15]);
xlim([0,20]);
set(gca,'fontsize',15)

copydir=[];

PrintFigure(h(1),'epspdf','LinReg',copydir,{'PaperPosition',[0,0,13,11],'PaperSize',[13,11]})
PrintFigure(h(2),'epspdf','LinRegBayes',copydir,{'PaperPosition',[0,0,13,11],'PaperSize',[13,11]})
  
       