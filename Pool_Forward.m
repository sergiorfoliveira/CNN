function  [Out, LastData] = Pool_Forward(In, LastData)
% Generates 2x2 samples of In
    [T,~,F] = size(In);
    HT = T/2;
    Img = zeros(T,T);
    Out = zeros(HT,HT,F);
    P = zeros(HT,HT,F,2);
    for f=1:F
        Img(1:T,1:T) = In(1:T,1:T,f);
        [Out(1:HT,1:HT,f), P(1:HT,1:HT,f,1:2)] = Pool2x2(Img);
    end
    LastData.Pool.LastPool = Out;
    LastData.Pool.Position = P;
end