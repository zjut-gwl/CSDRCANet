function [A, At, measure] = Measure_matrix_create(measure)

switch measure.model
    
    case  'Bernoulli'
        p = 0.5;
        Phi = double((rand(measure.block_size^2, measure.block_size^2)<p));
        Phi = Phi*2-1;
        for i =1:size(Phi,2)
            Phi(i,:) = Phi(i,:)/norm(Phi(i,:));
        end
        k = ceil(length(measure.OMEGA)/(measure.image_height*measure.image_width/measure.block_size^2));
        Phi_mt = zeros(k,measure.block_size^2);
        for j = 1:measure.block_size^2
            Phi_mt(1:k,j) = Phi(1:k,j)./(sum(abs(Phi(1:k,j)).^2));
        end
        Phi_mp = pinv(Phi(1:k,:));
        
    otherwise
        error('Unrecognized measurement model')
        
end



measure.Phi = Phi;
measure.Phi_mt = Phi_mt;
measure.Phi_mp = Phi_mp';
A=@(z)A_bp(z,measure.OMEGA,measure.P_image,measure.P_block,measure.Phi);
At=@(z)At_bp(z,measure.OMEGA,measure.P_image,measure.P_block,measure.Phi_mt);


end




