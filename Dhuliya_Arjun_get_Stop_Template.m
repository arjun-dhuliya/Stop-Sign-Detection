function [ template ] = Dhuliya_Arjun_get_Stop_Template(target_dim)
%DHULIYA_ARJUN_GET_STOP_TEMPLATE get a template of specified size for stop
% Stop Sign Template image was taken from internet
% http://www.clker.com/cliparts/7/0/1/f/12284235471892874034schoolfreeware_Stop_Sign.svg.med.png
% param target_dim is the size of the template we want

%below image chain creates a desired size stop sign template 
addpath('Images');
im = im2double(imread('template.jpg'));
template = im;
dim = size(im);
% gray = graythresh(im);
% imshow(im2bw(im,gray));
im = im(:,:,2)+im(:,:,3);
% imshow(im);

for r = 1: dim(2)
    % get first black pixel in template
    firstIndex = find(im(r,:)<=0.5,1);
    lastIndex = dim(1) - firstIndex;
    if(isempty(firstIndex))
        firstIndex = dim(1);
    end

    template(r,1:firstIndex,1)=-1;
    template(r,1:firstIndex,2)=-1;
    template(r,1:firstIndex,3)=-1;
    
    if(lastIndex~=0)
        template(r,lastIndex:end,1) = -1;
        template(r,lastIndex:end,2) = -1;
        template(r,lastIndex:end,3) = -1;
    end
    
    for y =firstIndex:lastIndex
        if(template(r,y,1)>0.8 && template(r,y,2)<0.5)
            template(r,y,1) = 0.5; 
            template(r,y,2) = 0.13; 
            template(r,y,3) = 0.17;
        end
        if(template(r,y,1)>0.8 && template(r,y,2)>0.5 && template(r,y,3)>0.5)
            template(r,y,1) = 0.6; 
            template(r,y,2) = 0.6; 
            template(r,y,3) = 0.6;
        end 
    end

end

if(min([target_dim(1),target_dim(2)]) < min([dim(1),dim(2)]))
    ratio = (min([target_dim(1),target_dim(2)])/min([dim(1),dim(2)])*0.95);
    template = imresize(template, ratio, 'nearest');
end
template(template(:,:,1)<=0) = -1;
template(template(:,:,2)<=0) = -1;
template(template(:,:,3)<=0) = -1;
% imshow(template);
end