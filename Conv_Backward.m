function  [LastData] = Conv_Backward(Gradient,LR,LastData)

    [F,~,S] = size(LastData.Filters);
    Out = zeros(F,S,S);
    [T,~,~,~] = size(LastData.Conv.ASI);
    P1 = zeros(S,S);
    P2 = P1;
    for t1=1:T
        for t2=1:T
            for f=1:F
                P1(1:S,1:S) = Out(f,1:S,1:S);
                P2(1:S,1:S) = LastData.Conv.ASI(t1,t2,1:3,1:3);
                Out(f,1:S,1:S) = P1 + Gradient(t1,t2,f)*P2;
            end
        end
    end
    LastData.Filters = LastData.Filters - LR*Out;
