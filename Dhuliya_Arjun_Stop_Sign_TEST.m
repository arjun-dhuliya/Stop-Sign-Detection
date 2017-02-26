function [] = Dhuliya_Arjun_Stop_Sign_TEST()
%Dhuliya_Arjun_Stop_Sign_TEST runs the Stop Sign Detection algorithm on all
%the test files
% addpath('Images');
addpath('Stop_Sign_Images');
addpath('Stop_Sign_Hi_Res');
close all;

% fails because of less pixel detail
% Dhuliya_Arjun_Stop_sign('Stop11.JPG');
% 
% 
% Dhuliya_Arjun_Stop_sign('Stop_hi_res11.JPG');
% Dhuliya_Arjun_Stop_sign('Stop_hi_res12.JPG');
% Dhuliya_Arjun_Stop_sign('Stop_hi_res13.JPG');
% Dhuliya_Arjun_Stop_sign('Stop_hi_res14.JPG');
% Dhuliya_Arjun_Stop_sign('Stop_hi_res15.JPG');
% Dhuliya_Arjun_Stop_sign('Stop_hi_res16.JPG');


%Passed
% Dhuliya_Arjun_Stop_sign('Stop_hi_res17.JPG');
% Dhuliya_Arjun_Stop_sign('Stop_hi_res18.JPG');
% Dhuliya_Arjun_Stop_sign('Stop_hi_res19.JPG');
% Dhuliya_Arjun_Stop_sign('Stop_hi_res20.JPG');
% Dhuliya_Arjun_Stop_sign('Stop_hi_res21.JPG');
% Dhuliya_Arjun_Stop_sign('Stop_hi_res22.JPG');

%fails because of less light, segments the board into two objects
% Dhuliya_Arjun_Stop_sign('Stop_hi_res23.JPG');

%Passed
% Dhuliya_Arjun_Stop_sign('Stop_hi_res24.JPG');
% Dhuliya_Arjun_Stop_sign('Stop_hi_res25.JPG');
% Dhuliya_Arjun_Stop_sign('Stop_hi_res26.JPG');
% Dhuliya_Arjun_Stop_sign('Stop_hi_res27.JPG');
% Dhuliya_Arjun_Stop_sign('Stop_hi_res28.JPG');


% Dhuliya_Arjun_Stop_sign('Stop_hi_res29.JPG');
% Dhuliya_Arjun_Stop_sign('Stop_hi_res30.JPG');
% Dhuliya_Arjun_Stop_sign('Stop_hi_res31.JPG');
% Dhuliya_Arjun_Stop_sign('Stop_hi_res32.JPG');


% detects only STO, so fixed 
% Dhuliya_Arjun_Stop_sign('Stop_hi_res33.JPG');


% Failed, Too Far away so could not detect
% Dhuliya_Arjun_Stop_sign('Stop_hi_res34.JPG');


% Success, only onces with less light and far away gets failed
% Dhuliya_Arjun_Stop_sign('Stop_hi_res35.JPG');
% Dhuliya_Arjun_Stop_sign('Stop_hi_res36.JPG');
% Dhuliya_Arjun_Stop_sign('Stop_hi_res37.JPG');
% Dhuliya_Arjun_Stop_sign('Stop_hi_res38.JPG');
% Dhuliya_Arjun_Stop_sign('Stop_hi_res39.JPG');
% Dhuliya_Arjun_Stop_sign('Stop_hi_res40.JPG');



% couple of them fails because of blur or they get segmented into two  
% Dhuliya_Arjun_Stop_sign('Stop_hi_res41.JPG');
% Dhuliya_Arjun_Stop_sign('Stop_hi_res42.JPG');
% Dhuliya_Arjun_Stop_sign('Stop_hi_res43.JPG');
% Dhuliya_Arjun_Stop_sign('Stop_hi_res44.JPG');
% Dhuliya_Arjun_Stop_sign('Stop_hi_res45.JPG');



% Dhuliya_Arjun_Stop_sign('Stop12.JPG');
% Dhuliya_Arjun_Stop_sign('Stop13.JPG');
% Dhuliya_Arjun_Stop_sign('Stop14.JPG');
% Dhuliya_Arjun_Stop_sign('Stop15.JPG');
% Dhuliya_Arjun_Stop_sign('Stop16.JPG');
% Dhuliya_Arjun_Stop_sign('Stop17.JPG');
% Dhuliya_Arjun_Stop_sign('Stop18.JPG');
% Dhuliya_Arjun_Stop_sign('Stop19.JPG');
% Dhuliya_Arjun_Stop_sign('Stop20.JPG');
% Dhuliya_Arjun_Stop_sign('Stop21.JPG');
% Dhuliya_Arjun_Stop_sign('Stop22.JPG');
% Dhuliya_Arjun_Stop_sign('Stop23.JPG');
% Dhuliya_Arjun_Stop_sign('Stop24.JPG');
% Dhuliya_Arjun_Stop_sign('Stop25.JPG');
% Dhuliya_Arjun_Stop_sign('Stop26.JPG');
% Dhuliya_Arjun_Stop_sign('Stop27.JPG');
% Dhuliya_Arjun_Stop_sign('Stop28.JPG');
% Dhuliya_Arjun_Stop_sign('Stop29.JPG');
% Dhuliya_Arjun_Stop_sign('Stop30.JPG');
% Dhuliya_Arjun_Stop_sign('Stop31.JPG');
% Dhuliya_Arjun_Stop_sign('Stop32.JPG');
% Dhuliya_Arjun_Stop_sign('Stop33.JPG');
% Dhuliya_Arjun_Stop_sign('Stop34.JPG');
% Dhuliya_Arjun_Stop_sign('Stop35.JPG');
% 
% Dhuliya_Arjun_Stop_sign('Stop45.JPG');
% Dhuliya_Arjun_Stop_sign('Stop44.JPG');


%success good example of how more amount of red means more processing time
% Dhuliya_Arjun_Stop_sign('confusion.jpg');

%fails if yellow eliminated with Green values
%fixed yellow passes
% Dhuliya_Arjun_Stop_sign('stop_loosy.jpg');


%colors are not detected, different camera and different lights
% Dhuliya_Arjun_Stop_sign('road_stop.jpg');

%Passed
% Dhuliya_Arjun_Stop_sign('animated_sign.jpg');
% Dhuliya_Arjun_Stop_sign('stop_campus.jpg');
% Dhuliya_Arjun_Stop_sign('stop_google.jpg');

%lower resolution hence fails
% Dhuliya_Arjun_Stop_sign('stop_loosy2.jpg');

% Example of template matching
% Dhuliya_Arjun_Stop_sign('stop_close.jpg');

% Dhuliya_Arjun_Stop_sign('stop_with_others.jpg');

%low details hence fails
% Dhuliya_Arjun_Stop_sign('stop_car.jpg');
% Dhuliya_Arjun_Stop_sign('stop_car2.jpg');
% 
% 
% Dhuliya_Arjun_Stop_sign('stop_car3.jpg');
% Dhuliya_Arjun_Stop_sign('stop_car4.jpg');
% Dhuliya_Arjun_Stop_sign('stop_car5.jpg');
% Dhuliya_Arjun_Stop_sign('stop_car6.jpg');

Dhuliya_Arjun_Stop_sign('stop_two_signs.jpg');
% pause(5)
close all;
end

