function [alpha_r] = alpha_r(Z,T,khi,z)

    alpha_r = (5.2e-14).*(khi(z)./T).^(1/2)*Z.*...
        (0.429 + 1/2.*log(khi(z)./T) + 0.469*(T./khi(z)).^(1/2)); %cm^3.s^(-1)

end