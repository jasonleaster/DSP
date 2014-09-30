%code writer	:	EOF
%code date	:	2014.10 .1
%e-mail		:	jasonleaster@gmail.com
%code file	:	demo_for_convolution%code writer	:	EOF
%code purpose:
%             A demo for convolution in LTI-system
clear all
close all

% you could use this varible to define how many number of points in the input sequence.
points = 10;

% x is used as input points
% h is used as responce sequnce.

% %% input sequence one
% x = exp(-[0: (points-1)]);
% h = ones(1,points*10);

%% Input sequence two
alpha = 2;
x = [1 1 1 1 1];
h = alpha.^([0:6]);

length_x = size(x,2);
length_h = size(h,2);

figure(1);
subplot(121);
scatter(1:length_x,x,'r');
title('x[n]');
subplot(122);
scatter(1:length_h,h,'g');
title('h[n]');

output = zeros(1,length_x+length_h -1);

%% Kernel part of our convolution sum   :- )
for current_point_n= 1:length_x + length_h

        tmp = current_point_n;
        while(tmp > 0)

            if  current_point_n <= length_x  &&  (current_point_n - tmp + 1) <= length_h
                     output(current_point_n) = output(current_point_n) + x(tmp)*h(current_point_n - tmp + 1);
            end
            
            if current_point_n > length_x && current_point_n < (length_h + length_x -1)
                
                if tmp > length_x
                    tmp = tmp -1;
                    continue;
                else
                    if (current_point_n - tmp + 1) <= length_h
                     output(current_point_n) = output(current_point_n) + x(tmp)*h(current_point_n - tmp + 1);       
                    end
                end
                
            end
            
            tmp = tmp -1;
        end

end

figure(2);
scatter(1:size(output,2),output,'filled');
title('output[n]');