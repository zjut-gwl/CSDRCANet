function [x_hat] = Prox_Moment_alpha(y,iters,width,height,M_func,Mt_func)

alpha = 1;
epsilon = 1;
M=@(x) M_func(x);
Mt=@(z) Mt_func(z);
denoi=@(noisy,sigma_hat) denoise(noisy,sigma_hat,width,height);
n=width*height;
m=length(y);
x_t{2} = zeros(n,1);
v_t=Mt((M(x_t{2}))'-y);
x_t{1}=x_t{2}-alpha.*v_t;
sigma_hat1=SigEstmate_SigCNN(reshape(x_t{1},height,width));
x_t{2}=double(denoi(x_t{1},sigma_hat1));
v_t = zeros(n,1);
for i=1:iters
    
    eta=randn(1,n);
    gamma=1/(m*epsilon).*eta*(denoi(x_t{1}+epsilon*eta',sigma_hat1)-x_t{2});
    v_t=gamma.*v_t+Mt((M(x_t{2}))'-y);
    x_t{1}=x_t{2}-alpha.*v_t;
    sigma_hat1=SigEstmate_SigCNN(reshape(x_t{1},height,width));   
    x_t{2}=double(denoi(x_t{1},sigma_hat1));
end
x_hat = x_t{2};
x_hat=reshape(x_hat,[height width]);
end


