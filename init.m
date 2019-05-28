function [k_b,AMU,lambda,h,eV,c,m_e,e_c,eps_0,M_sn,M_atom,area,power,power_density,at_num,T_e,n_ec] = init()

k_b    = 1.380658*10^(-23);    %J.K^(-1)
AMU    = 1.6605402*10^(-27);   %kg
lambda = 1064;                 %nm
h      = 6.6260755*10^(-34);   %J.s^(-1)
eV     = 1.602177*10^(-19);    %J
c      = 2.99792458*10^8;      %m.s^(-1)
m_e    = 9.1093897*10^(-31);   %kg
e_c    = 1.602177*10^(-19);    %C
eps_0  = 8.854187817*10^(-12); %F.m^(-1)
M_sn   = 118*AMU;
M_atom = M_sn;

%Sn plasmas

minor = [10 50 100]';   %µm
major = minor;          %µm
area  = pi*(minor/2).*(major/2); %µm^2

laser_pulse_length = 8;  %ns
pulse_energy       = 25; %mJ 
power              = pulse_energy/laser_pulse_length; %µW

power_density = (power*10^6)./(area*10^(-8)); %W.cm^(-2)

at_num = 6; %atomic number

T_e = (5.2e-6)*(at_num^(1/5))*(((lambda*10^(-3))^2).*power_density).^(3/5); %electron temperature in eV

n_ec = m_e*eps_0/(e_c^2)*(2*pi*c/(lambda*10^(-6)))^2;


end

