function [p]=errorshading(x,ylow,yhigh,color)
%does error 'shading' on x-coordinates x, and the lower and upper boundary
%of the shaded region given by ylow and yhigh. If ylow and yhigh have
%multiple rows, one shaded region is defined for each. color can be a
%single letter, a three vector entry, or a cell-array in case of muliple
%regions

if nargin==3
    %use standard color
    color=[1,1,1]*7/8;
end


for k=1:size(ylow,1)
   ylowloc=ylow(k,:)';
   xloc=x(min(k,end),:)';
   yhighloc=yhigh(k,:)';   
   if iscell(color)
       colorloc=color{k};
   else
       colorloc=color;
   end
  f = [yhighloc;flipdim(ylowloc,1)];
  p(k)=fill([xloc; flipdim(xloc,1)], f, colorloc, 'linestyle','none');
    %set(p(k),'facealpha',.5,'edgealpha',.5)
end

alpha(p, 0.15)
