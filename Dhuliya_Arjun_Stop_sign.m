function [] = Dhuliya_Arjun_Stop_sign (img_name )
% Image chain to detect road sign from image
% adding the folder path
%closing any opened figure
close all;
%adding possible image folder paths
addpath('Stop_Sign_Images');
addpath('Stop_Sign_Hi_Res');
addpath('Images');

%Open a new figure
% figure
%reading the image
im_input = imread(img_name);

%show original input image
% orignal = sprintf('%s Orignal',img_name);
% imshow(im_input);title(orignal);

% figure
% running the gaussian filter on image just a bit
im_smooth = imfilter(im_input,fspecial('gaussian',3));
imshow(im_smooth);
pause(2); % pause to let user see the image


%
% Idea of having the color based elimination was taken from 
% “Efficient Recognition of Speed Limit Signs” - Jim Torresen, Jorgen W. Bakke
% and Lukas Sekanina
% http://folk.uio.no/jimtoer/ITSC04_Torresen.pdf
% They proposed originally below values but I tweaked it
% RED if (R>77) and (R-G>17) and (R-B>17)
% WHITE if (R>108) and (G>108) and (B>108)
% BLACK if (R>122) and (G<122) and (B>122).

%Just taking the red channel, gives me red values of same size for input
im_r = im_smooth(:,:,1);
% Throw away values that are not desired reddish
im_r(~(im_smooth(:,:,1)>60 & (im_smooth(:,:,1)-im_smooth(:,:,2)>40) ...
    & (im_smooth(:,:,1)-im_smooth(:,:,3)>40))) = 0;
% throw away the yellow value, alot of boards are yellow
im_r(im_smooth(:,:,2)>(255*0.28) & im_smooth(:,:,2) - im_smooth(:,:,3)>10) = 0;

%Show the binary image of remaining areas.
imshow(im_r);
if(max(size(im_r))>800)
    % Use imclose to close the remaining figures just a little
    im_r = imclose(im_r, strel('disk',4));
end
% get rid of small areas in image to save time of processing
im_r = bwareaopen(im_r, 500);

% erode a bit to separate any uncesssarily connected parts like two sign
% just adjacent to each other
im_r = imerode(im_r,strel('Square',3));
% get information about connected components
CC = bwconncomp(im_r);
% label the Connected component, for processing
L = labelmatrix(CC);
% take a rgb representation of labelled image
RGB = label2rgb(L);
%show the labelled image
figure, imshow(RGB)

% have 4 variable for the storing information regarding if someone matched
% bestIndex is the index of the connected component of which matched with
% stop sign
bestIndex = -1;
% metric value, smaller the better
bestVal = inf;
% metric for best ratio found
bestRatio = inf;

% create a boolean array to indicate this component matched the stop sign
matched = false(1,CC.NumObjects);
oneMatchFound = false;

% one by one process all connected component
for i = 1:CC.NumObjects
    % get linear list of pixels, for this connected component
    p = CC.PixelIdxList(i);
    % get linear list of pixels, for this connected component
    p = [p{1,1}];
    %store the size of image
    dim = size(im_r);
    % convert the linear pixels for this component to coordinates or
    % subscript
    [r,c] = ind2sub(dim,p);
    % Create a rectangle for processing
    minR = min(r)-1;
    maxR = max(r)+1;
    minC = min(c)-1;
    maxC = max(c)+1;
    % Height of rectangle
    h = maxR-minR;
    % Width of rectangle
    w = maxC - minC;
    if(w>=16 && h>=16 && w> h/3 && h>w/3)
        % processing only if we got atleast 40 by 40 image, which can be
        % changed according to input images
        %Further not processing the image if the rectangle is too one
        %dimensional, goal is to find only components close to square
        im_copy = imcrop(im_smooth,[minC-3 minR-3 w+6 h+6]);

        %show only the area we are processing
        %imshow(im_copy);title(i);
        %get template for template matching of similar size

        %try to match the ocr STOP, in center of the component

        matched(1,i) = Dhuliya_Arjun_Stop_Try_Ocr(im_copy);
%         if(matched(1,i) == true)
%             oneMatchFound = true;
%         end

%         if(oneMatchFound ==  false && matched(1,i) ==false)
%              if(w>=40 && h>=40 && w> h/3 && h>w/3)
% 
%                 template = Dhuliya_Arjun_get_Stop_Template([h w]);
%                 % try to match the template
%                 [sad, ssd, w, h] = Dhuliya_Arjun_Wiki_TM(im_copy, template);
%                 sadPerPixel = double(sad) /(w*h);
%                 if(sadPerPixel < 0.0001 && sad<1000 && sad < bestVal && sadPerPixel < bestRatio)
%                     bestVal = sad;
%                     bestRatio = sadPerPixel;
%                     matched(1,i) = true;
%                 end
%              end
%         end
    end
end

figure;
imshow(im_smooth);
hold on;
% steps to mark the stop signs
for i = 1:CC.NumObjects 
    if(matched(1,i)==true)
        p = CC.PixelIdxList(i);
        p = [p{1,1}];
        dim = size(im_r);
        [r,c] = ind2sub(dim,p);
        minR = min(r)-20;
        maxR = max(r)+20;
        minC = min(c)-20;
        maxC = max(c)+20;
        h = maxR-minR;
        w = maxC - minC;
        % Then, from the help:
        rectangle('Position',[minC,minR,w,h],...
                   'EdgeColor','m', ...
                 'LineWidth',5,'LineStyle','-');
         title('marked Stop Sign');
         pause(3);
    end
end

