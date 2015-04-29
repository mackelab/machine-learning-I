close all
clear all

dx=.01;
x=-20:dx:20;

a=5;


h=figure;

LogPx=log(exp(-0.2*(x-a).^2)+exp(-0.1*(x-a-3).^2)+.3*exp(-0.01*(x+3).^2));

Px=exp(LogPx);

Px=Px/sum(Px)*dx;

LogPx=log(Px)'
dLogPx=

h(1)=figure
plot(x,Px)

h(2)=figure
plot(x,LogPx)

