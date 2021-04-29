function x = At_bp(b,OMEGA,P_image,P_block,Phi)
    
    N=length(P_block);
    block_size=sqrt(N);
    n=length(P_image)/(block_size^2);
    N = size(Phi,1);
    fx=zeros(n,N);
    if iscell(OMEGA)
        OMEGA=cell2mat(OMEGA);
    end
    if iscell(b)
        b=cell2mat(b);
    end
    fx(OMEGA)=b;
   
    fx=fx';
    x=zeros(N,n);
%     for i=1:n
%         B_temp=reshape(fx(:,i),[block_size,block_size]);
%         B_temp=Phi'*B_temp*Phi;
%         x(:,i)=B_temp(:);
%     end
%     x(P_block,:)=x;
    x(P_block,:)=Phi'*fx;
    l = sqrt(length(P_image));
    x=col2im(x,[block_size block_size],[l l],'distinct');
    %x=col2im(x,[block_size block_size],[512 512],'distinct');
    x=x(:);
    x(P_image)=x;
    
end