function [measure] = para_set(measure)


%% measurement parameter setting
[block_size1,block_size2]=size(measure.ori_im);
measure.image_width = block_size1;
measure.image_height = block_size2;
measure.rate_allocation = ceil(measure.image_width*measure.image_height*measure.rate);

q=1:(measure.image_width*measure.image_height);
step(1,1) = 1;
step(1,2) = measure.rate_allocation;
measure.OMEGA = q(step(1,1):step(1,2));
measure.block_size = 64;
measure.P_image=randperm(measure.image_height*measure.image_width);
measure.P_block=randperm(measure.block_size*measure.block_size);
%%
measure.denoize_name = 'RCAN_5x5_dilated_17cases';
measure.model = 'Bernoulli';   
end
