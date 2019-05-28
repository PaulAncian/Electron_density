clc 
clear variables
close all

[k_b,AMU,lambda,h,eV,c,m_e,e_c,eps_0,M_sn,M_atom,area,...
 power,power_density,at_num,T_e,n_ec] = init(); %initializing all the values we will need

filename0 = "SnIPs.prn"; 
filename1 = "SnShellRemainingElectrons.prn";

[IPs,RemainingElectrons] = read(filename0,filename1);

T_e1 = T_e(1);
T_e2 = T_e(2);
T_e3 = T_e(3);

[n_z1] = solve(IPs,RemainingElectrons,T_e1,n_ec);
[n_z2] = solve(IPs,RemainingElectrons,T_e2,n_ec);
[n_z3] = solve(IPs,RemainingElectrons,T_e3,n_ec);

x = 1:50;
grid on;

y1 = n_z1;
y2 = n_z2; 
y3 = n_z3;  
Y = [y1; y2; y3];

plot(x,Y);
legend('n_e @ T_e = 290.9509 eV','n_e @ T_e = 42.1751 eV','n_e @ T_e = 18.3578 eV');
ylabel('n_e/n_t_o_t');
xlabel('ion stage distribution');
title('variation of electron density with ion-stage distribution');



