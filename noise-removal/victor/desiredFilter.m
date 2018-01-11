function retorno = desiredFilter(M, wc)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    x = 0:M;
    m = x-M/2;
    %oppem
    %retorno = sin(wc*m)./(pi*m);
    %retorno(M/2+1) = wc/pi;
    
    %haykin

    retorno = (wc/pi)*(sin(wc*m))./(wc*m);
    %stem(retorno)
end

