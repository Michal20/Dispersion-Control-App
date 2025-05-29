function [R2, R3, H3, R4, H4, phi2_prism0] = ControlPrism(str_prism_ref_index, materials)
syms omega0;
syms R H w 
syms phi2_prism(w, R, H)
[phi2_prism(w, R, H)] = PrismPair(str_prism_ref_index);
syms phi2_prism0(omega0, R, H) 
phi2_prism0 = subs(phi2_prism,w,omega0);
syms phi(w)
[phi(w)] = TotalMaterialDispersion(materials);
syms phi2_material(omega0) 
phi2_material = subs(diff(phi, 2),w,omega0);
syms phi2_tot(omega0, R, H) phi3_tot(omega0, R, H) phi4_tot(omega0, R, H)
phi2_tot(omega0, R, H) = phi2_material(omega0) + phi2_prism0(omega0, R, H);
phi3_tot(omega0, R, H) = diff(phi2_tot, 1, omega0);
phi4_tot(omega0, R, H) = diff(phi3_tot, 1, omega0);
syms R2(omega0,H) H3(omega0) R3(omega0) H4(omega0) R4(omega0)
R2(omega0,H) = solve([phi2_tot(omega0, R, H) == 0], R);
phi3_tot(omega0,H) = vpa(subs(phi3_tot(omega0, R, H),R,R2));
H3(omega0) = solve([phi3_tot(omega0,H) == 0], H);
R3(omega0) = vpa(subs(R2(omega0,H),H,H3));
phi4_tot(omega0,H) = vpa(subs(phi4_tot(omega0, R, H),R,R2));
H4(omega0) = solve([phi4_tot(omega0,H) == 0], H);
R4(omega0) = vpa(subs(R2(omega0,H),H,H4));
