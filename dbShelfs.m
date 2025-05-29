function [shelfs] = dbShelfs()
filename = 'RefractiveIndexData.xlsx';
opts = detectImportOptions(filename);
opts.SelectedVariableNames = ["shelfName"];
shelfs = table2array(unique(readtable(filename, opts)));