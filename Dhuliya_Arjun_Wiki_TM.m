function [ bestSAD_R, bestSSD_R, w , h ] = Dhuliya_Arjun_Wiki_TM( I,T )
% implementing template matching calculating the SAD, 
% Wikipedia was refered for the algorithm
% https://en.wikipedia.org/wiki/Template_matching
% I is search image and T is template image
I = im2double(I);

    %resize image if too big, save time 
    while true
        dimI = size(I);
        dimT = size(T);
        changed = false;
        if(dimI(1)>200 || dimI(2) >200)
            ratio = (200/max([dimI(1),dimI(2)]));
            I = imresize(I,ratio);
            changed = true;
        end
        if(dimT(1)>200 || dimT(2) >200)
            T =Dhuliya_Arjun_get_Stop_Template([203 203]);
    %         T = imresize(,ratio);
            changed = true;
        end
        if(changed ==false)
            break;
        end
    end

    S = I;

    figure;
    subplot(2,1,1);
    imshow(T);
    title('Template');
    subplot(2,1,2);
    imshow(S);
    title('Search Image');

    % saving the dimensions of the image
    [S_rows, S_cols channels] = size(S);
    [T_rows, T_cols channels] = size(T);

    % set to store best match
    minSAD_R = Inf;
    minSSD_R = int32(Inf);

    %give me min SAD
    bestSAD_R = Inf;
    bestSSD_R = Inf;

    %loop through the search image
    for x = 0:S_rows - T_rows
        for y=0:S_cols - T_cols
            SAD = double(0.0);
            SSD_R = double(0.0);
            %loop through the template image
            for j=1: T_cols
                for i = 1:T_rows
                    sVAl_R = (S(x+i,y+j,1));
                    sVAl_G = (S(x+i,y+j,2));
                    sVAl_B = (S(x+i,y+j,3));

                    tVal_R = (T(i,j,1));
                    tVal_G = (T(i,j,2));
                    tVal_B = (T(i,j,3));

                    % More penulty for G and B
                    if(tVal_R ~=-1)
                            absDiff = (abs(sVAl_R - tVal_R)*10) + ...
                                (abs(sVAl_G - tVal_G)*30)+(abs(sVAl_B - tVal_B)*30);
                        squaredDiff = int32((sVAl_R - tVal_R).^2);
                        SAD = SAD + absDiff;
                        SSD_R = SSD_R + squaredDiff;
                    end
                end
                % save the best found position 
                if ( minSAD_R > SAD )
                    minSAD_R = SAD;
                    %give me min SAD
                    bestSAD_R = SAD;
                end
                if( minSSD_R > SSD_R )
                    minSSD_R  = SSD_R;
                    %give me min SSD
                    bestSSD_R = SSD_R;
                end
           end
        end
    end
    dimT = size(T);
    w = dimT(1);
    h = dimT(2);
end


