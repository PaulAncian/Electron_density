function [S] = S(T,ksi,khi,z) 

    S = (((9e-6).*ksi(z).*(T./khi(z)).^(1/2))...
        ./((khi(z).^(3/2)).*(4.88 + T./khi(z)))).*exp(-khi(z)./T); %cm^3.s^(-1)

end