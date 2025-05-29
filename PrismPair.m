function [phi2_prism]=PrismPair(str_prism_ref_index)
str_prism_ref_index = convertStringsToChars(str_prism_ref_index);
c = 299792458;
syms w lamb
if contains(str_prism_ref_index, "lamb")
    syms n_omega(lamb)
    n_omega(lamb) = str2func(['@(lamb)' str_prism_ref_index]);
    n_omega(w) = subs(n_omega(lamb), lamb, 2*pi*c/w);
else
    n_omega = str2func(['@(w)' str_prism_ref_index]);
end
syms lamb db1_nl(lamb) db2_nl(lamb) n_l(lamb) db1_nw(w) db2_nw(w)
n_l(lamb) = vpa(subs(n_omega(w),w,2*pi*c/lamb));
db1_nl(lamb) = diff(n_l(lamb), 1,lamb);
db2_nl(lamb) = diff(n_l(lamb), 2,lamb);
db1_nw(w) = diff(n_omega(w), 1,w);
db2_nw(w) = diff(n_omega(w), 2,w);
syms R H
syms phi2prism_l(lamb, R, H)
phi2prism_l(lamb, R, H) = lamb^3 *(H*db2_nl(lamb)-2*R* (db1_nl(lamb))^2)/(pi* c^2);
syms phi2_prism(w, R, H)
%phi2_prism(w, R, H) =  vpa(subs(phi2prism_l(lamb, R, H),lamb,2*pi*c/w));
phi2_prism(w, R, H) = (2*w/c)*(H*db2_nw(w)-2*R*(db1_nw(w)^2));
