function [Out, P]= Pool2x2(M)
% M is a square matrix of size YxY where Y is even
% Out(Y/2,Y/2) is a 2x2 sampling of M
% P contains the (r,c) coordinates of sample in the M matrix 
    [X,Y] = size(M);
    Out = zeros(X/2,Y/2);
    Submatrix = zeros(2,2);
    P = zeros(X/2,Y/2,2);
    j=1;
    for x=1:2:X
        k=1;
        for y=1:2:Y
            Submatrix(1:2,1:2) = [
                                  M(x  ,y), M(x  ,y+1);
                                  M(x+1,y), M(x+1,y+1)
                                 ];
            [Out(j,k),L,C] = MAX(Submatrix); 
            P(j,k,1)=L+x-1; % row coordinate in the M matrix
            P(j,k,2)=C+y-1; % column coordinate in the M matrix
            k=k+1;
        end
        j=j+1;
    end
end