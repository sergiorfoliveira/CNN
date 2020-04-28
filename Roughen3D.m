function [Out] = Roughen3D(In, Shape)
%Roughens a single one-dimensional array into a 3D array, line-major order.
    R = Shape(1);
    S = Shape(2);
    T = Shape(3);
    idx=1;
    Out = zeros(R,S,T);
    for r=1:R
        for s=1:S
            for t=1:T
                Out(r,s,t)=In(idx);
                idx=idx+1;
            end
        end
    end
end