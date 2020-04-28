function [output]= All3x3SubImgsFromOneImg(Img)
% img: only one grayscale image X x Y
% output: all the submatrices 3x3 from img
    [X,Y] = size(Img);
    output=zeros((X-2),(Y-2),3,3);
    sm=zeros(3,3);
    for j=1:X-2
        for k=1:Y-2
            sm(1:3,1:3)=[
                Img(j  ,k), Img(j  ,k+1), Img(j  ,k+2);
                Img(j+1,k), Img(j+1,k+1), Img(j+1,k+2);
                Img(j+2,k), Img(j+2,k+1), Img(j+2,k+2)
                ];
            output(j,k,1:3,1:3)=sm;
        end
    end
end