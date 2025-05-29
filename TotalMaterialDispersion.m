function [phi]=TotalMaterialDispersion(materials)
c = 299792458;
syms w
syms phi(w)
phi(w) = 0;
if ~isempty(materials)
    m = materials(:,[2 3]);
    [rows columns] = size(m);
    for n=1 : rows
        str_ref_index = m{n, 2};
        str_ref_index = convertStringsToChars(str_ref_index);
        if contains(str_ref_index, "lamb")
            syms lamb ref_index(lamb)
            ref_index(lamb) = str2func(['@(lamb)' str_ref_index]);
            ref_index(w) = subs(ref_index(lamb), lamb, 2*pi*c/w);
        else
            ref_index = str2func(['@(w)' str_ref_index]);
        end
        length = (10^-3)*str2double(m(n, 1));
        phi(w) = phi(w) + ref_index(w) *length * w / c;
    end
end