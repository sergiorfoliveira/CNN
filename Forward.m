function  [Acc, Loss, Out, LastData] = Forward(Img, Label, LastData)

    [Out, LastData] = Conv_Forward(Img/255 - 0.5,LastData);
    [Out, LastData] = Pool_Forward(Out,LastData);
    [Out, LastData] = SoftMax_Forward(Out,LastData);
    
    Loss = -log(Out(Label));
    [~, ArgMaxLin, ~] = MAX(Out);
    if (ArgMaxLin == Label)
        Acc=1;
    else
        Acc=0;
    end
end