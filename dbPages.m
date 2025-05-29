function [pages] = dbPages(shelf, book)
shelfstr = convertCharsToStrings(shelf);
bookstr = convertCharsToStrings(book);
filename = 'RefractiveIndexData.xlsx';
opts = detectImportOptions(filename);
opts.SelectedVariableNames = ["shelfName","bookName","name"];
T = readtable(filename, opts);
rows = (T.shelfName == shelfstr & T.bookName == bookstr);
pages = unique(T.name(rows));