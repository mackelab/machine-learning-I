if 1
dat=imread('Meadow.tiff');
dat1=double(dat(:,:,2));
dat2=double(dat(:,:,3));

end
[dd,bins]=hist3([dat1(:),dat2(:)],[220,220]);
dd=filter2(GaussFilter(11,3),dd,'same');
dd=dd(1:200,1:200);


pxy=(dd/sum(dd(:)));


subplot(2,2,1)
imagesc(pxy); axis xy
xlabel('x');
ylabel('y');

px=sum(pxy,2);
py=sum(pxy,1);


pxcondyin100to150=sum(pxy(:,100:150),2);
pxcondyin100to150=pxcondyin100to150/sum(pxcondyin100to150);

subplot(2,2,2)
plot(px)
hold on
plot(py,'r')
plot(pxcondyin100to150,'g');


subplot(2,2,3)

%pxcondy=pxy./repmat(py,1,200);

imagesc(pxy);

subplot(2,2,4)
pxyindep=px*py;
imagesc(pxyindep); axis xy



