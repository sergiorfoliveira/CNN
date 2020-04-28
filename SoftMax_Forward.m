function  [Out, LastData] = SoftMax_Forward(In,LastData)

    LastData.SoftMax.LastInputShape = size(In);
    In = Flatten3D(In);
    LastData.SoftMax.LastInput = In;  
    Totals = In * LastData.Weights;
    Totals = transpose(Totals) + LastData.Biases;
    LastData.SoftMax.LastTotals = Totals;
%     Exp_T = exp(Totals);              % This is the naïve approach
    M=max(Totals);Exp_T = exp(Totals-M);% This is the exp-normalize trick
    Sum_Exp_T = sum(Exp_T);
    Out = Exp_T / Sum_Exp_T;
    LastData.SoftMax.Exp_T = Exp_T;
    LastData.SoftMax.Sum_Exp_T = Sum_Exp_T;
end