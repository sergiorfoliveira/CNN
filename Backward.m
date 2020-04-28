function  [LastData] = Backward(Gradient,Label,LR,LastData)
    
    [Gradient,LastData] = SoftMax_Backward(Gradient,Label,LR,LastData);
    [Gradient] = Pool_Backward(Gradient,LastData);
    [LastData] = Conv_Backward(Gradient,LR,LastData);
    
end