function [psnr]=PSNR(x,x_hat)
[imheight, imwidth]=size(x);
MSE=sum(sum((double(x)-double(x_hat)).^2))/(imheight*imwidth);
psnr=10*log(255^2/MSE)/log(10);