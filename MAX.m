function [M,L,C]= MAX(Matrix)
% Finds the maximum value of a matrix and the first coordinate where
% this value appears in the matrix.
[X,Y]=size(Matrix);
M = max(max(Matrix));
    for x=1:X
        for y=1:Y
            if Matrix(x,y)==M
                L=x;
                C=y;
            end
        end
    end
end