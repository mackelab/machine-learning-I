close all
clear all

d=10;

x=-d:.1:d;

[xx,yy]=meshgrid(x,x);

f1=xx.^2+3*yy.^2;
f2=exp(-(xx.^2/20+.3*yy.^2))-2*exp(-((xx+1).^2/8+3*(yy+5).^2/10))-exp(-((xx-2).^2/20+3*(yy-4).^2/30))-xx/50+sin(yy)/8+cos(xx)/10;

h(1)=figure;
hs=surf(xx,yy,f1);

view([45,45])
set(hs,'edgecolor','none')
set(gca,'fontsize',14)
set(gca,'xticklabel',[],'yticklabel',[],'zticklabel',[])
lighting phong

h(2)=figure;
hs=surf(xx,yy,f2);

view([45,45])
set(hs,'edgecolor','none')
set(gca,'fontsize',14)
set(gca,'xticklabel',[],'yticklabel',[],'zticklabel',[])
lighting phong

copydir=[];
PrintFigure(h(1),'epspdf','Convex',copydir,{'PaperPosition',[0,0,13,11],'PaperSize',[13,11]})
PrintFigure(h(2),'epspdf','NotConvex',copydir,{'PaperPosition',[0,0,13,11],'PaperSize',[13,11]})

