function imstiled (imagein,handlefig,cmap,titleshow,sizevec,steponemore)
% imstiled (imagein,handlefig,cmap,titleshow,sizevec,steponemore)
% Tiles array of images
% cmap : colormap
% titleshow : shows title, if set to [] no title is shown
% sizevec : defines size of the subplot. If set to [] then automatic.
% steponemore : (0 default) steps into next window after plotting the last image. 

if ~exist('steponemore','var');
    steponemore=0;
end

if nargin<2 handlefig=0; end
if nargin<3 cmap=[]; end
if nargin<4 titleshow = []; end

d3=size(imagein,3);
d3tmp=d3;
if steponemore
    d3tmp=d3+1;
end

if ~isempty(titleshow)
    if length(titleshow) == 1
        titleshow = titleshow;
        titlename = num2cell(1:d3); % default title - number of figure
    else %specified ttile as a vector...
        titleshow = 1;
        titlename = num2cell(titleshow); 
    end
end


if nargin<5 % automatic
    sizevec = [];
end
d3=size(imagein,3);
d3tmp=d3;
if steponemore
    d3tmp=d3+1;
end

if isempty(sizevec)
    a = round(sqrt(d3tmp));
    b = ceil(d3tmp/a);
else % defined
    a = sizevec(1);
    b = sizevec(2);
end

if handlefig; figure(handlefig); end

for ii=1:d3
    subplot(a,b,ii)
    ims(imagein(:,:,ii),cmap,0,1);
    if titleshow
%         title(num2str(titlename{ii}));
        xlabel(num2str(titlename{ii}));
    end
end

% enable to plot something in another window...
if steponemore 
    subplot(a,b,ii+1)
end