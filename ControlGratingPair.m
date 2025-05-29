function[phi2_grating] = ControlGratingPair()
syms w L period ang phi2_grating(w, L, period, ang)
c = 299792458;
lambda = 2*pi*c/w;
phi2_grating(w, L, period, ang) = -lambda^3 *L/(pi* c^2 *period^-2) *(1-(lambda*period - sind(ang))^2)^(-3/2);
