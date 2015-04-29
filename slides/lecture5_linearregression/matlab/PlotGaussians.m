close all
clear all
xgrid=-10:.01:10;
mu=2; sigma=2;
y=normpdf(xgrid,mu,sigma);
plot(xgrid,y,'linewidth',2)
