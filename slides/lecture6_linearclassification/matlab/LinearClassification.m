%if 1
%addpath ~/CopyMPI/Code/toolboxes/spider
%use_spider
%end
close all
clear all
randn('seed',1)
rand('seed',0);
cov1=(eye(2)+ones(2))*3; %cov1(1)=3;
cov2=(eye(2)-.3*ones(2))*2;

N=100;
x1=(chol(cov1)'*randn(N,2)')'+repmat([2,0],N,1);
angelo=(rand(N,1)-1/2)*pi*.9;
x2=(chol(cov2)'*randn(N,2)')'-7*[cos(angelo),sin(angelo)]+repmat([2,0],N,1);;


xg=-10:.1:10;

[xx,yy]=meshgrid(xg,xg);

dx=[xx(:),yy(:)];

co1=cov(x1);
co2=cov(x2);
m1=mean(x1)';
m2=mean(x2)';

wlda=inv((co1+co2)/2)*(m1-m2);

disc1=reshape(dx*wlda,numel(xg),numel(xg))+1;

disc2=dx(:,1)*0;
for k=1:N
    disc2=disc2+exp(-sum((dx-repmat(x1(k,:),size(dx,1),1)).^2/5,2));
    disc2=disc2-exp(-sum((dx-repmat(x2(k,:),size(dx,1),1)).^2/5,2)); 
end
disc2=reshape(disc2,numel(xg),numel(xg));

h(1)=figure;
hold on
imagesc(xg,xg,disc1); colormap gray, axis xy
plot(x1(:,1),x1(:,2),'b+','linewidth',2);
hold on
plot(x2(:,1),x2(:,2),'ro','linewidth',2);
xlim([min(xg), max(xg)])
ylim([min(xg), max(xg)])
contour(xg,xg,disc1,[0,0],'w','linewidth',2)
axis equal, axis tight, axis off


h(2)=figure;
hold on
imagesc(xg,xg,disc2); colormap gray, axis xy
plot(x1(:,1),x1(:,2),'b+','linewidth',2);
hold on
plot(x2(:,1),x2(:,2),'ro','linewidth',2);
xlim([min(xg), max(xg)])
ylim([min(xg), max(xg)])
contour(xg,xg,disc2,[0,0],'w','linewidth',2)
axis equal, axis tight, axis off

copydir=[];
PrintFigure(h(1),'epspdf','LinClassification',copydir,{'PaperPosition',[0,0,13,13],'PaperSize',[13,13]})
PrintFigure(h(2),'epspdf','NonLinClassification',copydir,{'PaperPosition',[0,0,13,13],'PaperSize',[13,13]})


