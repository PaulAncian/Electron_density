function [alpha_3b] = alpha_3b(T,ksi,khi,z)

    alpha_3b = 2.97e-27.*ksi(z)./(T.*(khi(z).^2).*(4.88+T./khi(z))); %s^(-1)
    
end