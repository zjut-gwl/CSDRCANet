function [ denoised ] = denoise(noisy,sigma_hat,width,height)
noisy=reshape(noisy,[width,height]);
output=denoise_RCAN_5x5_dilated_17cases(noisy, sigma_hat);
denoised=output(:);
end
