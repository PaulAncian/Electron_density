function [n_z] = solve(IPs,RemainingElectrons,T_e,n_e)
    Z = 50;
    Maxstage = 49;
    Tpoints = 20;
    i = 1:Tpoints;
    z = 1:Maxstage+1;
    zz = 1:Maxstage;
    khi = IPs;
    ksi = flip(RemainingElectrons);
    
    %Calculations with T_e and z
    
%     alpha_3b_e = alpha_3b(T_e,ksi,khi,z+1);
%     
%     S_e = S(T_e,ksi,khi,z);
%     
%     alpha_r_e = alpha_r(Z,T_e,khi,z+1);
%         
%     zplusoverz_e = zeros(1,Maxstage);
    
    %zplusoverz_e(z) = S_e./(alpha_r_e + ...
    %                    n_e * alpha_3b_e);
                    
    %End of calculations with T_e and z                
    
    T_i = i/Tpoints*(max(T_e)-min(T_e)) + min(T_e);
    
    %Calculations with T_i and zz
    
    alpha_3b_i = alpha_3b(T_i,ksi,khi,zz+1);
    
    S_i = S(T_i,ksi,khi,zz);
    
    alpha_r_i = alpha_r(Z,T_i,khi,zz+1);
        
    zplusoverz_i = zeros(Maxstage-1,1);
    
    zplusoverz_i = S_i./(alpha_r_i + ...
                        n_e * alpha_3b_i);
    
    n_zz_i = 1;
    n_zz = zeros(1,Maxstage+1);
    for zz = 1:Maxstage
        n_zz_i = zplusoverz_i(zz)*n_zz_i;
        n_zz(zz) = n_zz_i;
    end
    n_zz_i = zplusoverz_i(Maxstage)*n_zz_i;
    n_zz(Maxstage+1) = n_zz_i;
    
    %End of calculations with T_i and zz
    
    n_tot_z = sum(n_zz);
    
    n_z = n_zz;
    
    for z = 1:Maxstage+1
        if n_z(z) == 0.0000
            n_z(z) = 1e-299;
        else
            n_z(z) = n_z(z)/n_tot_z;
        end
    end
    
end