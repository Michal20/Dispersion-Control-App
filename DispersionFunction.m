function [fphi, phi]=DispersionFunction(materials, order)
syms w
syms phi(w)
[phi(w)] = TotalMaterialDispersion(materials);
syms omega0 fphi(w, omega0)
fphi(w, omega0) = taylor(phi,w,'ExpansionPoint', omega0, 'Order', order + 1) - taylor(phi,w,'ExpansionPoint', omega0, 'Order', 2);
