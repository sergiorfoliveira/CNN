function [MCorrel]= Correl(ASI, Filters)
% N images, each one with T sub-images, each sub-image of size 3x3  
    [F,FS,~]=size(Filters);
    [T,~,~,~]=size(ASI);
    MCorrel=zeros(T,T,F);
    A=zeros(FS,FS);
    B=A;
    C=zeros(T,T,F,FS,FS);
    for t1=1:T 
        for t2=1:T
            for f=1:F 
                A(1:FS,1:FS) = Filters(f,1:FS,1:FS);
                B(1:FS,1:FS) = ASI(t1,t2,1:FS,1:FS);
                C(t1,t2,f,1:FS,1:FS) = A .* B;
                %MCorrel(t1,t2,f) = sum(C(t1,t2,f,:,:), 'all');
                MCorrel(t1,t2,f) = sum(C(t1,t2,f,:));
            end
        end
    end
end

