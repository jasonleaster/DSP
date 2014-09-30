%code writer	:	EOF
%code date	:	2014.09.11
%e-mail		:	jasonleaster@gmail.com
%code file	:	convolution_input_side.m
%code purpose:
%             A demo for convolution.
clear all
close all

x = [0 -1 -1.2 2 1.4 1.4 0.8 0 -0.8];
h = [1 -0.6 -0.4 -0.1];

length_x = size(x,2);
length_h = size(h,2);

output = zeros(1,length_h+length_x);

figure(1);
subplot(121);
scatter(1:length_x,x,'r','filled');
title('x[n]');
subplot(122);
scatter(1:length_h,h,'g','filled');
title('h[n]');

for tmp_1 = 1:length_x

	for tmp_2 = 1:length_h
	
		output(tmp_1+tmp_2-1) = output(tmp_1+tmp_2-1) + x(tmp_1)*h(tmp_2);
	end
end

figure(2);
scatter(1:size(output,2),output,'filled');
title('output[n]');
