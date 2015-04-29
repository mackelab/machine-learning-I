close all
clear all
x=-1:.01:1;

h=figure;
a=1;
L=@(x)(x.^4+x.^2*a);
dL=@(x)(4*x.^3+a*2*x);
ddL=@(x)(12*x.^2+a*2);

plot(x,L(x),'linewidth',2);
hold on
alpha=1;

xnew=.9;

for i=1:8
xlim([min(x), max(x)]*1.1);
ylim([0,max(L(x))*1.1]);
set(gca,'tickdir','out')
set(gca,'box','off')
copydir=[];




xi(i)=xnew;

Ldap=L(xnew);
grad=dL(xnew);
curv=ddL(xnew);
%Ldap=xnew.^2;
%grad=2*xnew;
%curv=2;


approxer=Ldap+0.5*(x-xnew).^2*curv+grad*(x-xnew);
plot(xnew,Ldap,'r.','Markersize',20);
PrintFigure(h(1),'epspdf',['Newton' num2str(i-1)],copydir,{'PaperPosition',[0,0,13,11],'PaperSize',[13,11]})



xnew=xnew-  inv(curv)*grad;
plot(x,approxer,'r','linewidth',1.5)
%plot(xnew,L(xnew),'g.');


%pause
end
