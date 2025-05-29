function [L_2, phi2_win] = ControlWindow(str_window_ref_index, materials)
str_window_ref_index = convertStringsToChars(str_window_ref_index);
c = 299792458;
syms w 
if contains(str_window_ref_index, "lamb")
    syms n_omega(lamb)
    n_omega(lamb) = str2func(['@(lamb)' str_window_ref_index]);
    n_omega(w) = subs(n_omega(lamb), lamb, 2*pi*c/w);
else
    n_omega = str2func(['@(w)' str_window_ref_index]);
end
syms omega0
syms w L
syms phi2_win(w, L)
phi2_win(w, L) = L/c * diff(n_omega(w)*w,2);
syms phi(w)
[phi(w)] = TotalMaterialDispersion(materials);
syms  phi2_tot_win(omega0,L)
phi2_tot_win(omega0,L) = subs(diff(phi, 2),w,omega0) + subs(phi2_win(w, L),w,omega0);
syms  L_2(omega0)
assume(L, 'real');
L_2(omega0) = vpa(solve([phi2_tot_win(omega0,L) == 0],L));
