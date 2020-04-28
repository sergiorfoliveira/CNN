function  [Loss, Acc, LastData] = Train(Img, Label, LastData, LR)
    
    Gradient = zeros(10,1);
    [Acc, Loss, Out, LastData] = Forward(Img, Label, LastData);
    Gradient(Label) = -1 / Out(Label);
    [LastData] = Backward(Gradient,Label,LR,LastData);

end