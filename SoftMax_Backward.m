function  [Out,LastData] = SoftMax_Backward(Gradient,n,LR,LastData)

    Exp_T = LastData.SoftMax.Exp_T;
    S = LastData.SoftMax.Sum_Exp_T;
    d_Out_d_T = -Exp_T(n) * Exp_T / (S ^ 2);
    d_Out_d_T(n) = Exp_T(n) * (S - Exp_T(n)) / (S ^ 2);
    d_T_d_W = LastData.SoftMax.LastInput;
    d_T_d_B = 1;
    d_T_d_Inputs = LastData.Weights;
    d_L_d_T = Gradient(n) * d_Out_d_T;
    d_L_d_W = transpose(d_T_d_W) * transpose(d_L_d_T);
    d_L_d_B = d_L_d_T * d_T_d_B;
    Out = d_T_d_Inputs * d_L_d_T;
    Out = Roughen3D(Out, LastData.SoftMax.LastInputShape);
    LastData.Weights = LastData.Weights - LR * d_L_d_W;
    LastData.Biases = LastData.Biases - LR * d_L_d_B;
end