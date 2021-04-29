function output=SigEstmate_SigCNN(noisy)
name='SigCNN.mat';
useGPU = 1;
load(name);%loads net

if useGPU == 1
    noisy = single(noisy./(255./2)-1);
    noisy=real(noisy);
    input = gpuArray(noisy);
    net = vl_simplenn_move(net, 'gpu') ;
    res = vl_simplenn(net,input,[],[],'conserveMemory',true,'mode','test');
    output = res(end).x;
    output = double(gather(output*255/2));
    
else
    
    noisy = noisy/(255/2)-1;
    input = noisy;
    res = simplenn_matlab(net, input);
    output = res(end).x;
   
end


end