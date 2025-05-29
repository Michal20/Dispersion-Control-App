function [formula] = dbFormula(page, book)
pagestr = convertCharsToStrings(page);
bookstr = convertCharsToStrings(book);
filename = 'RefractiveIndexData.xlsx';
opts = detectImportOptions(filename);
opts.SelectedVariableNames = ["bookName","name","formula"];
T = readtable(filename, opts);
rows = (T.bookName == bookstr & T.name == pagestr);
f = unique(T.formula(rows));
formula = f{1,1};