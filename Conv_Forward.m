function  [Out, LastData] = Conv_Forward(In,LastData)

    LastData.Conv.LastInput = In;
    ASI = All3x3SubImgsFromOneImg(In); % All sub-images of size 3x3
    LastData.Conv.ASI = ASI;
    Out = Correl(ASI, LastData.Filters);

end