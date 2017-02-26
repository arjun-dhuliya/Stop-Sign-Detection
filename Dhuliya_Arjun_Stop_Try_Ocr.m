function [ matched ] = Dhuliya_Arjun_Stop_Try_Ocr( im )
%DHULIYA_ARJUN_STOP_TRY_OCR Summary image chain tries to test if passed im
%has STOP returned on it

    %step by step try to run ocr in 5 stages and hope one of them gets it
    matched = false;
    % use thining with below factors
    figure;
    %matlab sample code on how to use ocr function was referred
    %http://www.mathworks.com/help/vision/ref/ocr.html
    Iclean = im2double(im);
    
    dimI = size(Iclean);
    BW2 = im2bw(Iclean);
%     BW2 = imerode(BW2,strel('square',factor));
%     BW2 = imclose(BW2,strel('square',factor));
% %             BW2 = imerode(BW2,strel('square',1));
    roi = [dimI(2)/16 dimI(1)/4  dimI(2)*(14/16) dimI(1)*(2/4)];
    ocrData = ocr(BW2, roi , 'CharacterSet', 'STOP') ;
    txt = ocrData.Text;
    imshow(imcrop(BW2,roi));
    title(txt);
    txt = regexprep(txt,'[^\w'']','');
    if(size(strfind(txt,'STOP'))>0)
        imshow(imcrop(BW2,roi));
        matched = true;
        title('Cropped: Stop found by OCR');
    %     pause(5);
        return
    end
    
    BW2 = imclose(BW2,strel('square',2));
    roi = [dimI(2)/16 round(dimI(1)/3.5)  dimI(2)*(14/16) round(dimI(1)*(1.5/3.5))];
    ocrData = ocr(BW2, roi , 'CharacterSet', 'STOP') ;
    txt = ocrData.Text;
    imshow(imcrop(BW2,roi));
    title(txt);
    txt = regexprep(txt,'[^\w'']','');
    if(size(strfind(txt,'STOP'))>0)
        imshow(imcrop(BW2,roi));
        matched = true;
        title('Cropped: Stop found by OCR');
    %     pause(5);
        return
    end


    for factor = 1:3
%         for addFactor = 1:factor
            % try cleaning the image for ocr
            dimI = size(Iclean);
            BW2 = im2bw(Iclean);
            BW2 = imerode(BW2,strel('square',factor));
            BW2 = imclose(BW2,strel('square',factor));
%             BW2 = imerode(BW2,strel('square',1));
            roi = [dimI(2)/16 dimI(1)/4  dimI(2)*(14/16) dimI(1)*(2/4)];
            ocrData = ocr(BW2, roi , 'CharacterSet', 'STOP') ;
            txt = ocrData.Text;
            imshow(imcrop(BW2,roi));
            title(txt);
            txt = regexprep(txt,'[^\w'']','');
            if(size(strfind(txt,'STOP'))>0 | max(size(txt(:)))>=2)
                imshow(imcrop(BW2,roi));
                matched = true;
                title('Cropped: Stop found by OCR');
            %     pause(5);
                return
            end
%         end
    end
end

