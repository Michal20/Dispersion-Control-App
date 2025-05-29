function [books] = dbBooks(shelf)
shelfstr = convertCharsToStrings(shelf);
filename = 'RefractiveIndexData.xlsx';
opts = detectImportOptions(filename);
opts.SelectedVariableNames = ["shelfName","bookName"];
T = readtable(filename, opts);
rows = (T.shelfName == shelfstr);
books = unique(T.bookName(rows,:));