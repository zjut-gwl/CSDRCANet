function predict_im = Enc_main(ori_im, measure)

[A, At, measure] = Measure_matrix_create(measure);
measure.ori_im = ori_im;
y = A(ori_im);
AMP_iters = 20;
[predict_im]  = Prox_Moment_alpha(y',AMP_iters,measure.image_height,measure.image_width,A,At);

end