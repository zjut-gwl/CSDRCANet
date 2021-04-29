clear;
warning off
%%
addpath('../matconvnet-1.0-beta25/matlab/simplenn');
addpath('measure')
addpath('../Trained_Weights/SigCNN');
addpath('../Trained_Weights/RCAN_5x5_dilated_17cases');
run('../matconvnet-1.0-beta25/matlab/vl_setupnn.m');
%%
Test_image_dir = '../Test_Images/Set8/';
measure.rate = 0.1;
measure.Image_name='2.tif';
measure.Test_image_dir = fullfile(Test_image_dir, measure.Image_name);
ori_im = double(imread(measure.Test_image_dir));
measure.ori_im = ori_im;
[measure] = para_set(measure);
rec_im = Enc_main(ori_im, measure);
fprintf('Denoiser:%s, Rate:%f, measure_model:%s, Image_name:%s, PSNR:%f \n', measure.denoize_name, measure.rate, measure.model, measure.Image_name,  PSNR(rec_im, ori_im));
%%


