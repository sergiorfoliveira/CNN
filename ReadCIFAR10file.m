function [imgset,labels]= ReadCIFAR10file(file)
% file: a CIFAR-10 file
% labels: the respective labels
% imgset: images of size 32x32x1 (grayscale)
% ref: http://www.cs.toronto.edu/~kriz/cifar.html
    load(file, "data", "labels");
    labels=labels+1; %Because file is zero-based indexed (Python origin...)
    [R,~]=size(data);
    imgset=zeros(R,32,32);
    for r=1:R
        idx=1;
        for x=1:32
            for y=1:32
                % Convert to grayscale:
                imgset(r, x, y)=(data(r,idx)      + ...
                                 data(r,idx+1024) + ...
                                 data(r,idx+2048))/3;
                idx=idx+1;
            end
        end
    end
end