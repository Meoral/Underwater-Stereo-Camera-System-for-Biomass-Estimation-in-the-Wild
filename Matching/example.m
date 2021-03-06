%function:
%       ??????????????
%       ???????????????
%referrence?
%      ?????????????????????? ????
%date:2015-1-8
%author:chenyanan
%????????http://blog.csdn.net/u010278305

%?????????
clear;close all
template_rgb = imread('SL_P.bmp');
src_rgb = imread('SL.bmp');

%??????
template=rgb2gray(template_rgb);    template = im2double(template);
src=rgb2gray(src_rgb);  src = im2double(src);

figure('name','??????'),
subplot(1,2,1),imshow(template_rgb),title('??'),

%????????????
tempSize=size(template);
tempHeight=tempSize(1); tempWidth=tempSize(2);
srcSize=size(src);
srcHeight=srcSize(1); srcWidth=srcSize(2);

%??????????0
%By default, paddarray adds padding before the first element and after the last element along the specified dimension.
srcExpand=padarray(src,[tempHeight-1 tempWidth-1],'post');

%????????? tmp:mj  template:x
%?????????? Page561
distance=zeros(srcSize);
for height=1:srcHeight
    disp(height/srcHeight)
   for width= 1:srcWidth
      tmp=srcExpand(height:(height+tempHeight-1),width:(width+tempWidth-1));
      %diff= template-tmp;
      %distance(height,width)=sum(sum(diff.^2));
      %??????
      distance(height,width)=sum(sum(template'*tmp-0.5.*(tmp'*tmp)));
   end
end

%????????????
maxDis=max(max(distance));
[x, y]=find(distance==maxDis);

%??????
subplot(1,2,2),imshow(src_rgb);title('????'),hold on
rectangle('Position',[x y tempWidth tempHeight],'LineWidth',2,'LineStyle','--','EdgeColor','r'),
hold off