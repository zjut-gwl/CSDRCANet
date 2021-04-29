function b = A_bp(x,OMEGA,P_image,P_block,Phi)


N=length(P_block);
block_size=sqrt(N);
x=x(P_image);
l = sqrt(length(P_image));
x=reshape(x,[l l]);
B=im2col(x,[block_size block_size],'distinct');
B=B(P_block,:);
% for i=1:size(B,2)
%     B_temp=reshape(B(:,i),[block_size,block_size]);
%     B_temp=Phi*B_temp*Phi';
%     fx(:,i)=B_temp(:);
% end
fx=Phi*B;
fx=fx';
if iscell(OMEGA)
    for i=1:length(OMEGA)
        b{i}=fx(OMEGA{i});
    end
else
    b=fx(OMEGA);
end

end