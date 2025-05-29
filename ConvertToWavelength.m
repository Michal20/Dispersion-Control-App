function [f_wavelength]=ConvertToWavelength(f)
c = 299792458;
syms w lamb
syms f_wavelength(lamb)
f_wavelength(lamb) = subs(f(w), w, 2*pi*c/lamb);
