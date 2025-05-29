function [fref_index]=RefractiveIndex(str_ref_index)
str_ref_index = convertStringsToChars(str_ref_index);
c = 299792458;
syms w
syms fref_index(w)
if contains(str_ref_index, "lamb")
    syms lamb fref_index(lamb)
    fref_index(lamb) = str2func(['@(lamb)' str_ref_index]);
    fref_index(w) = abs(subs(fref_index(lamb), lamb, 2*pi*c/w));
else
    fref_index = str2func(['@(w)' str_ref_index]);
end