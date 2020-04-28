function [Out]= Flatten3D(In)
% Flattens a 3D array into a single 1xN array
    idx=1;
    [R,S,T] = size(In);
    Out = zeros(1,R*S*T);
    for r=1:R
        for s=1:S
            for t=1:T
                Out(idx)=In(r,s,t);
                idx=idx+1;
            end
        end
    end
end