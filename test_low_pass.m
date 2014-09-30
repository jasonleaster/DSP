%code writer	:	EOF
%code date	:	2014.09.11
%e-mail		  :	jasonleaster@gmail.com
%code file	:	convolution_input_side.m
%code purpose:
%        Just a demo for low-pass filter by convolution.


clear all
close all

% 'y' is a simulation for original pure signal
y = sin(0.5*pi*[0:0.05:8]); 
% 'u' is a simulation for noise.
u = 0.2*sin(8*pi*[0:0.05:8]);

figure(1);
subplot(211);
plot(1:size(y,2),y);
title('original pure signal'); %BUG, I don't know why I can't write title on this figure.
subplot(212);
plot(1:size(u,2),u);
title('noise');

input_signal = y + u;

x = input_signal;
h = [1 1 1 1 1 1 1 1 1 1]*0.1;

length_x = size(x,2);
length_h = size(h,2);

output_signal = zeros(1,length_h+length_x);

figure(2);
subplot(211);
plot(1:length_x,x);
subplot(212);
scatter(1:length_h,h,'filled');

for tmp_1 = 1:length_x

	for tmp_2 = 1:length_h
	
		output_signal(tmp_1+tmp_2-1) = output_signal(tmp_1+tmp_2-1) + x(tmp_1)*h(tmp_2);
	end
end

figure(3);
plot(1:size(output_signal,2),output_signal);
title('Output signal');
